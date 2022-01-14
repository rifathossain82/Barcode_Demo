import 'package:barcode_flutter/pages/Barcode%20Generator.dart';
import 'package:barcode_flutter/pages/Barcode%20Scanner.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner & Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BarcodeScanner()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 120,
                width: MediaQuery.of(context).size.width*0.8,
                child: Center(child: Text('Barcode Scanner',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(height: 16,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BarcodeGenerator()));
                },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 120,
                width: MediaQuery.of(context).size.width*0.8,
                child: Center(child: Text('Barcode Generator',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
