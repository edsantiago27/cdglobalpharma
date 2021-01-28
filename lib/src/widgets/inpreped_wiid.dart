import 'package:flutter/material.dart';
import 'package:cdglobalpharma/src/providers/provider_inpre.dart';
import 'package:cdglobalpharma/src/models/model_inpreped.dart';

class InprepedByFolio extends StatelessWidget {
  List<InprepedModel> data;

  getPrep() {
    ProviderInpre.listInpre().then((value) {
      print("=====> " + value.toString());
      print("======> " + json.decode(value.body));
      Iterable list = json.decode(value.body);
      List<InprepedModel> inpreList = List<InprepedModel>();
      inpreList = list.map((e) => InprepedModel.fromJson(e)).toList();

      if (inpreList != null) {
        setState(() {
          data = inpreList;
        });
      }
      // if (data == null) {
      //   Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }
      //  else {

      //   return data = inpreList;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    data == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: SingleChildScrollView(
              child: PaginatedDataTable(
                header: Text('Preparación'),
                columns: [
                  DataColumn(label: Text('CodB')),
                  DataColumn(label: Text('Cant')),
                  DataColumn(label: Text('Ubic')),
                  DataColumn(label: Text('Lot')),
                  DataColumn(label: Text('Bod')),
                ],
                source: dts,
                onRowsPerPageChanged: (r) {
                  setState(() {
                    _rowsPerPage = r;
                  });
                },
                rowsPerPage: _rowsPerPage,
              ),
            ),
          );
  }
}
