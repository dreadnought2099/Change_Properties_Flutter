import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Properties & Vegetable List',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const DynamicUI(),
    );
  }
}

class DynamicUI extends StatefulWidget {
  const DynamicUI({Key? key}) : super(key: key);

  @override
  _DynamicUIState createState() => _DynamicUIState();
}

class _DynamicUIState extends State<DynamicUI> {
  final List<Color> colors = [
    const Color.fromARGB(255, 34, 231, 34),
    const Color.fromARGB(255, 223, 226, 10),
    const Color.fromARGB(255, 243, 33, 33),
  ];

  final List<String> _vegetables = [
    'Carrot',
    'Broccoli',
    'Cauliflower',
    'Spinach',
    'Potato',
    'Tomato',
  ];

  int colorIndex = 0;
  double boxSize = 250.0;
  String boxText = "King Long";
  Color boxColor = const Color.fromARGB(192, 34, 231, 34);

  void changeProperties() {
    setState(() {
      boxColor = colors[colorIndex];
      colorIndex = (colorIndex + 1) % colors.length;
      boxText = boxText == "King Long" ? "Yutang" : "Welcome to Minecraft!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic User Interface"),
      ),
      backgroundColor: const Color.fromARGB(57, 179, 230, 230),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: boxColor,
                shape: BoxShape.circle, // Makes the container circular
              ),
              width: boxSize, // Fixed size
              height: boxSize, // Fixed size
              child: Center(
                child: Text(
                  boxText,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: changeProperties,
            child: const Text("Change Color"),
          ),
          const SizedBox(height: 20),
          // Vegetable list section
          Expanded(
            child: ListView.builder(
              itemCount: _vegetables.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_vegetables[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
