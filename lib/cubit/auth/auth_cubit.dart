import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/user_model.dart';

/// Auth State - Represents the different states of authentication
/// This class defines all possible states for authentication operations
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Auth Initial State - The initial state when the app starts
class AuthInitial extends AuthState {}

/// Auth Loading State - When authentication operations are in progress
class AuthLoading extends AuthState {}

/// Auth Authenticated State - When user is successfully authenticated
class AuthAuthenticated extends AuthState {
  final firebase_auth.User user;
  final User userModel;

  const AuthAuthenticated({
    required this.user,
    required this.userModel,
  });

  @override
  List<Object?> get props => [user, userModel];
}

/// Auth Unauthenticated State - When user is not authenticated
class AuthUnauthenticated extends AuthState {}

/// Auth Error State - When an error occurs during authentication
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Auth Event - Represents the different events that can be triggered
/// This class defines all possible events for authentication operations
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Check Auth Status Event - Checks if user is already authenticated
class CheckAuthStatus extends AuthEvent {}

/// Sign Up Event - Triggers user registration
class SignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const SignUp({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object?> get props => [email, password, name];
}

/// Sign In Event - Triggers user login
class SignIn extends AuthEvent {
  final String email;
  final String password;

  const SignIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

/// Sign Out Event - Triggers user logout
class SignOut extends AuthEvent {}

/// Update User Profile Event - Updates user profile information
class UpdateUserProfile extends AuthEvent {
  final String name;
  final String? phoneNumber;
  final String? address;

  const UpdateUserProfile({
    required this.name,
    this.phoneNumber,
    this.address,
  });

  @override
  List<Object?> get props => [name, phoneNumber, address];
}

/// Auth Cubit - Manages the state for authentication operations
/// This cubit handles all authentication-related business logic and state management
class AuthCubit extends Cubit<AuthState> {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  /// Constructor - Initializes the cubit with Firebase services
  AuthCubit({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore,
        super(AuthInitial());

  /// Check if user is already authenticated
  /// This method is called when the app starts to check authentication status
  Future<void> checkAuthStatus() async {
    try {
      // Emit loading state
      emit(AuthLoading());

      // Get current user from Firebase Auth
      final user = _firebaseAuth.currentUser;
      
      if (user != null) {
        // User is authenticated, fetch user data from Firestore
        final userModel = await _getUserData(user.uid);
        
        if (userModel != null) {
          // Emit authenticated state
          emit(AuthAuthenticated(user: user, userModel: userModel));
        } else {
          // User data not found in Firestore, sign out
          await _firebaseAuth.signOut();
          emit(AuthUnauthenticated());
        }
      } else {
        // No user is authenticated
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      // Emit error state if something goes wrong
      emit(AuthError(e.toString()));
    }
  }

  /// Sign up a new user
  /// This method creates a new user account and stores user data in Firestore
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Emit loading state
      emit(AuthLoading());

      // Create user account with Firebase Auth
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        // Create user model
        final userModel = User(
          id: user.uid,
          email: email,
          name: name,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isEmailVerified: user.emailVerified,
        );

        // Save user data to Firestore
        await _saveUserData(userModel);

        // Emit authenticated state
        emit(AuthAuthenticated(user: user, userModel: userModel));
      } else {
        // Emit error if user creation failed
        emit(const AuthError('Failed to create user account'));
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Handle Firebase Auth specific errors
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'An account already exists for that email.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        default:
          errorMessage = 'An error occurred during sign up: ${e.message}';
      }
      emit(AuthError(errorMessage));
    } catch (e) {
      // Handle other errors
      emit(AuthError(e.toString()));
    }
  }

  /// Sign in an existing user
  /// This method authenticates a user with email and password
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Emit loading state
      emit(AuthLoading());

      // Sign in with Firebase Auth
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        // Fetch user data from Firestore
        final userModel = await _getUserData(user.uid);
        
        if (userModel != null) {
          // Emit authenticated state
          emit(AuthAuthenticated(user: user, userModel: userModel));
        } else {
          // User data not found, sign out
          await _firebaseAuth.signOut();
          emit(const AuthError('User data not found'));
        }
      } else {
        // Emit error if sign in failed
        emit(const AuthError('Failed to sign in'));
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Handle Firebase Auth specific errors
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email address.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        default:
          errorMessage = 'An error occurred during sign in: ${e.message}';
      }
      emit(AuthError(errorMessage));
    } catch (e) {
      // Handle other errors
      emit(AuthError(e.toString()));
    }
  }

  /// Sign out the current user
  /// This method signs out the user and clears authentication state
  Future<void> signOut() async {
    try {
      // Emit loading state
      emit(AuthLoading());

      // Sign out from Firebase Auth
      await _firebaseAuth.signOut();

      // Emit unauthenticated state
      emit(AuthUnauthenticated());
    } catch (e) {
      // Emit error state if something goes wrong
      emit(AuthError(e.toString()));
    }
  }

  /// Update user profile information
  /// This method updates user data in Firestore
  Future<void> updateUserProfile({
    required String name,
    String? phoneNumber,
    String? address,
  }) async {
    try {
      // Get current state
      final currentState = state;
      
      if (currentState is AuthAuthenticated) {
        // Create updated user model
        final updatedUserModel = currentState.userModel.copyWith(
          name: name,
          phoneNumber: phoneNumber,
          address: address,
          updatedAt: DateTime.now(),
        );

        // Save updated user data to Firestore
        await _saveUserData(updatedUserModel);

        // Emit updated authenticated state
        emit(AuthAuthenticated(
          user: currentState.user,
          userModel: updatedUserModel,
        ));
      }
    } catch (e) {
      // Emit error state if something goes wrong
      emit(AuthError(e.toString()));
    }
  }

  /// Save user data to Firestore
  /// This method stores user information in the Firestore database
  Future<void> _saveUserData(User userModel) async {
    await _firestore
        .collection('users')
        .doc(userModel.id)
        .set(userModel.toJson());
  }

  /// Get user data from Firestore
  /// This method retrieves user information from the Firestore database
  Future<User?> _getUserData(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      
      if (doc.exists) {
        return User.fromJson(doc.data()!);
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Get current user from state
  /// This method returns the current user if authenticated
  firebase_auth.User? getCurrentUser() {
    final currentState = state;
    
    if (currentState is AuthAuthenticated) {
      return currentState.user;
    }
    
    return null;
  }

  /// Get current user model from state
  /// This method returns the current user model if authenticated
  User? getCurrentUserModel() {
    final currentState = state;
    
    if (currentState is AuthAuthenticated) {
      return currentState.userModel;
    }
    
    return null;
  }

  /// Check if user is authenticated
  /// This method returns true if user is currently authenticated
  bool isAuthenticated() {
    return state is AuthAuthenticated;
  }
}
