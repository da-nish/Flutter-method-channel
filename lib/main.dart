import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "";

  Future<void> _callNative() async {
    _message = await CallNativeMethod().callNative();
    print(_message);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _message,
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child: const Text(
                "Call Native Method",
              ),
              onPressed: () => _callNative(),
            ),
          ],
        ),
      ),
    );
  }
}

class CallNativeMethod {
  static const platform = MethodChannel('example.com/channel');
  Future<String> callNative() async {
    try {
      final String result = await platform.invokeMethod('customMethodName');
      return result;
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
      return "Error";
    }
  }
}
