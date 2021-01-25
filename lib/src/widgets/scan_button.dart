import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  //const ScanButton(barcodeScanRes, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return FloatingActionButton(

      child: Icon(Icons.filter_center_focus),
      onPressed: () async {

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#1ED760', 'Cancelar', false, ScanMode.BARCODE);
        print(barcodeScanRes);
        
      },
    );
  }
}
