import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/Provider/favourite_provider.dart';
import 'package:movie/Routes/app_navigation.dart';
import 'package:movie/Routes/app_navigation_routes.dart';
import 'package:movie/Routes/route_generator.dart';
import 'package:movie/Utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteMoviesProvider())
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Network App',
          navigatorKey: AppNavigation.navigationKey,
          initialRoute: AppNavRoutes.initialRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
          //Theme
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          // //system
          themeMode: ThemeMode.light,
        );
      }),
    );
  }
}
