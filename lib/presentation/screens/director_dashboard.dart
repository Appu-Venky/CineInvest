import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/auth/auth_bloc.dart';
import '../../logic/blocs/auth/auth_event.dart';
import 'create_movie_screen.dart';

class DirectorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Director Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateMovieScreen()));
              },
              child: Text("Create New Movie Project"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Investment Tracking
              },
              child: Text("Track Investments & Withdraw Funds"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Post Updates for Investors
              },
              child: Text("Post Updates for Investors"),
            ),
          ],
        ),
      ),
    );
  }
}
