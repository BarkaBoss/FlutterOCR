import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Scanner App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final MobileScannerController _scannerController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
        actions: [
          IconButton(
              onPressed: (){
            _scannerController.switchCamera();
          },
              icon: const Icon(Icons.flip_camera_android)
          )
        ],
      ),
      body: MobileScanner(
          allowDuplicates: false,
          controller: _scannerController,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan QR');
            } else {
              final String code = barcode.rawValue!;
              debugPrint('QR found! $code');
            }
          }),
    );
  }
}
