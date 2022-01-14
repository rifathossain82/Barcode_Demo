import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeGenerator extends StatefulWidget {
  const BarcodeGenerator({Key? key}) : super(key: key);

  @override
  _BarcodeGeneratorState createState() => _BarcodeGeneratorState();
}

class _BarcodeGeneratorState extends State<BarcodeGenerator> {

  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Barcode Generator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              shadowColor: Colors.orange,
              color: Colors.white,
              child: Padding(
                padding:EdgeInsets.only(left: 12,right: 12,top: 12,bottom: 12),
                child: BarcodeWidget(
                    data: controller.text,
                    barcode: Barcode.code128(),
                  height: 200,
                  width: 200,
                  drawText: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white,fontSize: 20),
                onSubmitted: (_){
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter data',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
