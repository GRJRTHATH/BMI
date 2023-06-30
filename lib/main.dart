import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuri Grj',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Yuri & Moon Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  var bgColor = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Yuri&Moon"),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bmi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: 'Enter your weight (in Kgs)',
                    prefixIcon: const Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    labelText: 'Enter your height (in Feet)',
                    prefixIcon: const Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    labelText: 'Enter your height in inches',
                    prefixIcon: const Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();
                    if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);
                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);
                      var msg = "";
                      if (bmi > 25) {
                        msg = "You're Overweight!!";
                        bgColor = Colors.orange;
                      } else if (bmi < 18) {
                        msg = "You're Underweight!!";
                        bgColor = Colors.red;
                      } else {
                        msg = "You're Healthy";
                        bgColor = Colors.blue;
                      }
                      setState(() {
                        result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required fields!!";
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
