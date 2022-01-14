import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String? scanResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: scanBarcode,
                icon: Icon(Icons.camera_alt),
                label: Text('Start Scan')),
            SizedBox(
              height: 16,
            ),
            InkWell(
                onTap: () async {
                  if (!await launch(
                    'http://www.google.com/search?q=$scanResult',
                    forceSafariVC: true,
                    forceWebView: true,
                    enableJavaScript: true,
                  )) {
                    throw 'Could not launch $scanResult';
                  }
                },
                child: Text(
                  scanResult == null
                      ? 'Scan a code'
                      : 'Scan Result: $scanResult',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void scanBarcode() async {
    late String sanresult;
    try {
      sanresult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      scanResult = 'Failed to scan';
    }
    if (!mounted) {
      return;
    }

    setState(() {
      scanResult = sanresult;
    });
  }
}
