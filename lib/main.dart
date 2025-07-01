import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';

import 'data/services/api_service.dart';
import 'data/services/database_service.dart';


import 'cubit/auth/auth_cubit.dart';
import 'cubit/product/product_cubit.dart';
import 'cubit/cart/cart_cubit.dart';
import 'cubit/theme/theme_cubit.dart';


import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}


class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        Provider<FirebaseAuth>(create: (context) => FirebaseAuth.instance),
        Provider<FirebaseFirestore>(
          create: (context) => FirebaseFirestore.instance,
        ),

        // Provide data services
        Provider<ApiService>(create: (context) => ApiService()),
        Provider<DatabaseService>(create: (context) => DatabaseService()),

        // Provide cubits
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            firebaseAuth: context.read<FirebaseAuth>(),
            firestore: context.read<FirebaseFirestore>(),
          ),
        ),
        BlocProvider<ProductCubit>(
          create: (context) =>
              ProductCubit(apiService: context.read<ApiService>()),
        ),
        BlocProvider<CartCubit>(
          create: (context) =>
              CartCubit(databaseService: context.read<DatabaseService>()),
        ),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit(prefs: prefs)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          // Load theme when app starts
          if (themeState is ThemeInitial) {
            context.read<ThemeCubit>().loadTheme();
            return const MaterialApp(
              home: SplashScreen(),
              debugShowCheckedModeBanner: false,
            );
          }

          // Determine theme based on state
          final isDarkMode = themeState is ThemeLoaded
              ? themeState.isDarkMode
              : false;

          return MaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,

            // Theme configuration
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

            // Route configuration
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/onboarding': (context) => const OnboardingScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/home': (context) => const HomeScreen(),
            },

            // Error handling
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
