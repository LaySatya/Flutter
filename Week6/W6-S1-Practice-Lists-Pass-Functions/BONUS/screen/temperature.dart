import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  final VoidCallback switchpage;

  const Temperature({super.key, required this.switchpage});

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  String _fahrenheit = "0"; 

  void _convertTemperature(String value) {
    try {
      final double celsius = double.parse(value);
      final double fahrenheit = celsius * 9 / 5 + 32;
      setState(() {
        _fahrenheit = fahrenheit.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        if(value != ""){
          _fahrenheit = "Invalid input";
        }
        else{
          _fahrenheit = "0";
        }
      });
    }
  }

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
            onPressed: widget.switchpage,
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.thermostat_outlined,
                  size: 120,
                  color: Colors.white,
                ),
                const Center(
                  child: Text(
                    "Converter",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
                const SizedBox(height: 50),
                const Text("Temperature in Degrees:", style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                TextField(
                  onChanged: _convertTemperature,
                  decoration: inputDecoration,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number, // Allow only numbers
                ),
                const SizedBox(height: 30),
                const Text("Temperature in Fahrenheit:", style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: textDecoration,
                  child: Text(
                    _fahrenheit,
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
