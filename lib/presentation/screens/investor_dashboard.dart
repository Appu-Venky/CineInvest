import 'package:flutter/material.dart';

class InvestorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Investor Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to browse movie projects
              },
              child: Text("Browse Movie Projects"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Track Investments
              },
              child: Text("Track Investments & Earnings"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to View ROI & Payouts
              },
              child: Text("View ROI & Payout Status"),
            ),
          ],
        ),
      ),
    );
  }
}
