import 'package:flutter/material.dart';
//import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class Work2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Work2State();
}

class _Work2State  extends State<Work2>{

  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: Column(
              children: <Widget>[
              Expanded(
                flex: 5,
                  child: QRView(key: qrKey,
                      overlay: QrScannerOverlayShape(
                        borderRadius: 10,
                        borderColor: Colors.red,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                      onQRViewCreated: _onQRViewCreate),
              ),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text("Result: $qrText"),
                    ),
                )
              ],
          ));
    }

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  
  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }
}
