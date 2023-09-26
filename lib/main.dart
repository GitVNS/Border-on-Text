import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BorderTextExample(),
    );
  }
}

class BorderTextExample extends StatefulWidget {
  const BorderTextExample({super.key});

  @override
  State<BorderTextExample> createState() => _BorderTextExampleState();
}

class _BorderTextExampleState extends State<BorderTextExample> {
  String text = '';

  List<double> strokeSizes = [2, 5, 7, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffca311),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (double strokeSize in strokeSizes)
            Padding(
              padding: EdgeInsets.all(10 + strokeSize),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.delius(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = strokeSize
                        ..color = const Color(0xffffffff),
                    ),
                  ),
                  Text(
                    text,
                    style: GoogleFonts.delius(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff000000),
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Theme(
              data: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
              child: TextField(
                onChanged: (value) => setState(() => text = value),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Enter text",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  focusColor: Colors.white,
                  border: const OutlineInputBorder(),
                  fillColor: Colors.black12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
