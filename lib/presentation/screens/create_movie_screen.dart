import 'package:flutter/material.dart';

class CreateMovieScreen extends StatefulWidget {
  @override
  _CreateMovieScreenState createState() => _CreateMovieScreenState();
}

class _CreateMovieScreenState extends State<CreateMovieScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Movie Project")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Movie Title"),
            ),
            TextField(
              controller: budgetController,
              decoration: InputDecoration(labelText: "Budget Amount"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle movie creation logic (Bloc integration later)
              },
              child: Text("Create Movie"),
            ),
          ],
        ),
      ),
    );
  }
}
