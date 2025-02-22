import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/auth_repository.dart';
import 'logic/blocs/auth/auth_bloc.dart';
import 'logic/blocs/auth/auth_event.dart';
import 'presentation/screens/director_dashboard.dart';
import 'presentation/screens/investor_dashboard.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(
          create: (context) => AuthBloc(AuthRepository())..add(AppStarted()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Investment App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/director': (context) => DirectorDashboard(),
          '/investor': (context) => InvestorDashboard(),
        },
      ),
    );
  }
}
