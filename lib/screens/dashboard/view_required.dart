import 'package:flutter/material.dart';

import '../../app/constants/color.dart';
import '../../widgets/custom_cell.dart';

class ViewRequired extends StatefulWidget {
  ViewRequired({super.key});

  @override
  State<ViewRequired> createState() => _ViewRequiredState();
}

class _ViewRequiredState extends State<ViewRequired> {
  bool sort = true;

  var sortColumnIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("View Required"),
        centerTitle: true,
        backgroundColor: TColors.appbarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: DataTable(
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
                      pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    ),
                    onSort: (columnIndex, ascending) {
                      sort = !sort;
                      sortColumnIdx = columnIndex;
                      setState(() {});
                    },
                  ),
                  DataColumn(
                    label: const CustomCell(
                      text: 'Rate',
                      color: TColors.buttonColor,
                      pad: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        sort = !sort;
                        sortColumnIdx = columnIndex;
                      });
                    },
                  ),
                  DataColumn(
                    label: const CustomCell(
                      text: 'Floor',
                      color: TColors.buttonColor,
                      pad: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onSort: (columnIndex, ascending) {
                      sort = !sort;
                      sortColumnIdx = columnIndex;
                      setState(() {});
                    },
                  ),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(
                      CustomCell(
                        text: 'Carpet',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                    ),
                    DataCell(
                      CustomCell(
                        text: 'CarpetRate',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                    DataCell(
                      CustomCell(
                        text: 'FloorLevel',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      CustomCell(
                        text: 'Carpet',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                    ),
                    DataCell(
                      CustomCell(
                        text: 'CarpetRate',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                    DataCell(
                      CustomCell(
                        text: 'FloorLevel',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      CustomCell(
                        text: 'Carpet',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                    ),
                    DataCell(
                      CustomCell(
                        text: 'CarpetRate',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                    DataCell(
                      CustomCell(
                        text: 'FloorLevel',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      CustomCell(
                        text: 'Carpet',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                    ),
                    DataCell(
                      CustomCell(
                        text: 'CarpetRate',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                    DataCell(
                      CustomCell(
                        text: 'FloorLevel',
                        color: TColors.textBackgroundColor,
                        pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
