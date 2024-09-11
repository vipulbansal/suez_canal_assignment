import 'package:flutter/material.dart';

// Reusable Loading Widget
class LoadingWidget extends StatelessWidget {
  final String? message;

  const LoadingWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(), // Main loading spinner
          SizedBox(height: 20), // Space between spinner and message
          if (message != null)
            Text(
              message!,
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
