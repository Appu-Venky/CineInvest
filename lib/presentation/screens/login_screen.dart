import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/auth/auth_bloc.dart';
import '../../logic/blocs/auth/auth_event.dart';
import '../../logic/blocs/auth/auth_state.dart';
import 'director_dashboard.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DirectorDashboard()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
              TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
              SizedBox(height: 20),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LoginRequested(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                    },
                    child: state is AuthLoading ? CircularProgressIndicator() : Text("Login"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
