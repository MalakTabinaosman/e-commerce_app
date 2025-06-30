import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';

/// Theme State - Represents the different states of theme
/// This class defines all possible states for theme operations
abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

/// Theme Initial State - The initial state when the app starts
class ThemeInitial extends ThemeState {}

/// Theme Loading State - When theme is being loaded from storage
class ThemeLoading extends ThemeState {}

/// Theme Loaded State - When theme has been successfully loaded
class ThemeLoaded extends ThemeState {
  final bool isDarkMode;

  const ThemeLoaded({required this.isDarkMode});

  @override
  List<Object?> get props => [isDarkMode];

  /// Create a copy of ThemeLoaded with updated values
  ThemeLoaded copyWith({bool? isDarkMode}) {
    return ThemeLoaded(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}

/// Theme Error State - When an error occurs while managing theme
class ThemeError extends ThemeState {
  final String message;

  const ThemeError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Theme Event - Represents the different events that can be triggered
/// This class defines all possible events for theme operations
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

/// Load Theme Event - Loads theme from SharedPreferences
class LoadTheme extends ThemeEvent {}

/// Toggle Theme Event - Toggles between light and dark mode
class ToggleTheme extends ThemeEvent {}

/// Set Theme Event - Sets theme to a specific mode
class SetTheme extends ThemeEvent {
  final bool isDarkMode;

  const SetTheme(this.isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}

/// Theme Cubit - Manages the state for theme operations
/// This cubit handles all theme-related business logic and state management
class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences _prefs;

  /// Constructor - Initializes the cubit with SharedPreferences
  ThemeCubit({required SharedPreferences prefs})
      : _prefs = prefs,
        super(ThemeInitial());

  /// Load theme from SharedPreferences
  /// This method retrieves the saved theme preference
  Future<void> loadTheme() async {
    try {
      // Emit loading state
      emit(ThemeLoading());

      // Get theme preference from SharedPreferences
      final isDarkMode = _prefs.getBool(AppConstants.themeKey) ?? false;

      // Emit loaded state
      emit(ThemeLoaded(isDarkMode: isDarkMode));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(ThemeError(e.toString()));
    }
  }

  /// Toggle between light and dark mode
  /// This method switches the current theme and saves the preference
  Future<void> toggleTheme() async {
    try {
      // Get current state
      final currentState = state;
      
      if (currentState is ThemeLoaded) {
        // Toggle the theme
        final newIsDarkMode = !currentState.isDarkMode;
        
        // Save the new preference
        await _prefs.setBool(AppConstants.themeKey, newIsDarkMode);
        
        // Emit updated state
        emit(ThemeLoaded(isDarkMode: newIsDarkMode));
      }
    } catch (e) {
      // Emit error state if something goes wrong
      emit(ThemeError(e.toString()));
    }
  }

  /// Set theme to a specific mode
  /// This method sets the theme to the specified mode and saves the preference
  Future<void> setTheme(bool isDarkMode) async {
    try {
      // Save the theme preference
      await _prefs.setBool(AppConstants.themeKey, isDarkMode);
      
      // Emit updated state
      emit(ThemeLoaded(isDarkMode: isDarkMode));
    } catch (e) {
      // Emit error state if something goes wrong
      emit(ThemeError(e.toString()));
    }
  }

  /// Get current theme mode
  /// This method returns the current theme mode from state
  bool getCurrentThemeMode() {
    final currentState = state;
    
    if (currentState is ThemeLoaded) {
      return currentState.isDarkMode;
    }
    
    // Default to light mode if no theme is loaded
    return false;
  }

  /// Check if dark mode is enabled
  /// This method returns true if dark mode is currently active
  bool isDarkMode() {
    return getCurrentThemeMode();
  }

  /// Check if light mode is enabled
  /// This method returns true if light mode is currently active
  bool isLightMode() {
    return !getCurrentThemeMode();
  }
} 