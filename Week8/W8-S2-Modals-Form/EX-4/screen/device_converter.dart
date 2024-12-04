import 'package:flutter/material.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _dollarController = TextEditingController();
  String _selectedDevice = 'RIEL';
  double _convertedAmount = 0.0;

  final Map<String, double> _conversionRates = {
    'RIEL': 4100.0,
    'EURO': 0.90,
    'DONG': 24000.0,
  };

  void _converting() {
    final double? dollars = double.tryParse(_dollarController.text);
    if (dollars != null) {
      setState(() {
        _convertedAmount = dollars * _conversionRates[_selectedDevice]!;
      });
    }
  }

  @override
  void dispose() {
    _dollarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[600],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('Device Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.money,
                size: 60,
                color: Colors.white,
              ),
              const Center(
                child: Text(
                  "Converter",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const SizedBox(height: 50),
              const Text("Amount in dollars:"),
              const SizedBox(height: 10),
              TextField(
                controller: _dollarController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollars',
                  hintStyle: const TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) => _converting(),
              ),
              const SizedBox(height: 30),
              const Text("Device:"),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedDevice,
                dropdownColor: Colors.orange[700],
                items: _conversionRates.keys.map((String device) {
                  return DropdownMenuItem<String>(
                    value: device,
                    child: Text(device,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDevice = newValue!;
                    _converting();
                  });
                },
              ),
              const SizedBox(height: 30),
              const Text("Amount in selected device:"),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _convertedAmount.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
