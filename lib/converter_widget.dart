import 'package:flutter/material.dart';

class ConverterWidget extends StatefulWidget {
  @override
  _ConverterWidgetState createState() => _ConverterWidgetState();
}

class _ConverterWidgetState extends State<ConverterWidget> {
  double inputSuhu = 0;
  double hasilKonversi = 0;
  String selectedConversion = 'Celsius to Kelvin';

  final TextEditingController _controller = TextEditingController();

  List<String> conversionOptions = [
    'Celsius to Fahrenheit',
    'Fahrenheit to Celsius',
    'Celsius to Kelvin',
    'Kelvin to Celsius',
    'Celsius to Reaumur',
    'Reaumur to Celsius',
  ];

  void convertTemperature() {
    setState(() {
      inputSuhu = double.tryParse(_controller.text) ?? 0;
      hasilKonversi = convertTemperatureValue(inputSuhu, selectedConversion);
    });
  }

  double convertTemperatureValue(double value, String conversionType) {
    switch (conversionType) {
      case 'Celsius to Fahrenheit':
        return (value * 9 / 5) + 32;
      case 'Fahrenheit to Celsius':
        return (value - 32) * 5 / 9;
      case 'Celsius to Kelvin':
        return value + 273.15;
      case 'Kelvin to Celsius':
        return value - 273.15;
      case 'Celsius to Reaumur':
        return value * 4 / 5;
      case 'Reaumur to Celsius':
        return value * 5 / 4;
      default:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aplikasi Konversi Suhu")),
      body: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Masukkan suhu"),
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Suhu',
                      prefixIcon: Icon(Icons.thermostat), // Tetap ada ikon di dalam input field
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    value: selectedConversion,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedConversion = newValue!;
                      });
                    },
                    items: conversionOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Text(option),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: convertTemperature,
                    child: Text("Konversi"),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green), // Tetap ada ikon hasil
                      SizedBox(width: 5),
                      Text(
                        "Hasil: ${hasilKonversi.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
