import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black54, size: 30),
          backgroundColor: Colors.transparent,
          // centerTitle: true,
          // title: Text(
          //   'A B O U T  U S',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 28,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Have To Do",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Aachen',
              ),
            ),
            const Text(
              "Version: 1.0.0",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/splash.png",
                width: 200,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.copyright, size: 15),
                const SizedBox(width: 5),
                const Text(
                  "2024 Dimuthu Wayaman",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
