import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double fahrenheit = 0;
  double reamur = 0;

  void konversi() {
    setState(() {
      inputUser = double.parse(etInput.text);
      reamur = 4 / 5 * inputUser;
      fahrenheit = 9 / 5 * inputUser + 32;
      kelvin = inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suhu Converter"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF59D), Color(0xFFFFE082)],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Masukkan Nilai Suhu Celsius",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
              controller: etInput,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildConversionCard("Kelvin", kelvin),
                _buildConversionCard("Fahrenheit", fahrenheit),
                _buildConversionCard("Reamur", reamur),
              ],
            ),
            ElevatedButton(
              onPressed: konversi,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFD54F),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text(
                "Konversi",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConversionCard(String label, double value) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              value.toStringAsFixed(2),
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}