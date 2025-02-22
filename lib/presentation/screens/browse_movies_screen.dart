import 'package:flutter/material.dart';

class BrowseMoviesScreen extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {"title": "Sci-Fi Thriller", "budget": "5M", "description": "A thrilling sci-fi adventure"},
    {"title": "Romantic Drama", "budget": "3M", "description": "A love story set in Paris"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Browse Movie Projects')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(movies[index]["title"]!),
              subtitle: Text("Budget: ${movies[index]["budget"]!}"),
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle investment logic
                },
                child: Text("Invest"),
              ),
            ),
          );
        },
      ),
    );
  }
}
