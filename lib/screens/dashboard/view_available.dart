import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/main.dart';

import '../../app/constants/color.dart';
import '../../widgets/custom_cell.dart';

class ViewAvailable extends StatefulWidget {
  const ViewAvailable({super.key});

  @override
  State<ViewAvailable> createState() => _ViewAvailableState();
}

class _ViewAvailableState extends State<ViewAvailable> {
  bool sort = true;
  var sortColumnIdx = 0;

  Future? getAllData;
  PostgrestResponse? result;
  List? datalist;

  @override
  void initState() {
    super.initState();
    getAllData = _getAllData();
  }

  Future<List<dynamic>?> _getAllData() async {
    result = await supabase.from('available_office').select().execute();
    datalist = result?.data as List;
    return datalist;
  }

  void _sort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        datalist?.sort((a, b) => a['sqft'].compareTo(b['sqft']));
      } else {
        datalist?.sort((a, b) => b['sqft'].compareTo(a['sqft']));
      }
    }
    if (columnIndex == 1) {
      if (ascending) {
        datalist?.sort((a, b) =>
            a['sqftrate'].toString().compareTo(b['sqftrate'].toString()));
      } else {
        datalist?.sort((a, b) =>
            b['sqftrate'].toString().compareTo(a['sqftrate'].toString()));
      }
    }
    if (columnIndex == 2) {
      if (ascending) {
        datalist?.sort(
          (a, b) => a['floor'].toString().compareTo(b['floor'].toString()),
        );
      } else {
        datalist?.sort(
          (a, b) => b['floor'].toString().compareTo(a['floor'].toString()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("View Available"),
        centerTitle: true,
        backgroundColor: TColors.appbarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: getAllData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          child: const Center(child: CircularProgressIndicator()));
                    } else if (snapshot.hasData) {
                      return DataTable(
                        sortAscending: sort,
                        sortColumnIndex: sortColumnIdx,
                        decoration: const BoxDecoration(color: Colors.white),
                        border: TableBorder.all(style: BorderStyle.none),
                        dividerThickness: 0,
                        columnSpacing: 8,
                        dataRowMinHeight: 38,
                        headingTextStyle: const TextStyle(color: Colors.white),
                        showBottomBorder: false,
                        columns: [
                          DataColumn(
                            label: const CustomCell(
                              text: 'Carpet',
                              color: TColors.buttonColor,
                            ),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                sort = !sort;
                                sortColumnIdx = columnIndex;
                              });
                              _sort(columnIndex, ascending);
                            },
                          ),
                          DataColumn(
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                setState(() {
                                  sort = !sort;
                                  sortColumnIdx = columnIndex;
                                });
                                _sort(columnIndex, ascending);
                              });
                            },
                            label: const CustomCell(
                              text: 'Rate',
                              color: TColors.buttonColor,
                            ),
                          ),
                          DataColumn(
                            label: const CustomCell(
                              text: 'Floor',
                              color: TColors.buttonColor,
                            ),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                sort = !sort;
                                sortColumnIdx = columnIndex;
                              });
                              _sort(columnIndex, ascending);
                            },
                          ),
                        ],
                        rows: [
                          if (datalist!.isNotEmpty && datalist != null)
                            ...datalist!.map(
                              (rowData) => DataRow(cells: [
                                DataCell(
                                  CustomCell(
                                    text: rowData['sqft'].toString(),
                                    color: TColors.textBackgroundColor,
                                  ),
                                ),
                                DataCell(
                                  CustomCell(
                                    text: rowData['sqftrate'].toString(),
                                    color: TColors.textBackgroundColor,
                                  ),
                                ),
                                DataCell(
                                  CustomCell(
                                    text: rowData['floor'].toString(),
                                    color: TColors.textBackgroundColor,
                                  ),
                                ),
                              ]),
                            )
                        ],
                      );
                    } else {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
