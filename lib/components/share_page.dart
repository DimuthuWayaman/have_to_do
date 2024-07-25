import 'package:flutter/material.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.red,
          
         appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'A B O U T  U S',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
         ),
        ),
    );
  }
}