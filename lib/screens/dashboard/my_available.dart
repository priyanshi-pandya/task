import 'package:flutter/material.dart';
import 'package:task/widgets/rounded_button.dart';
import '../../app/constants/color.dart';
import '../../widgets/custom_cell.dart';

class MyAvailable extends StatefulWidget {
  MyAvailable({super.key});

  @override
  State<MyAvailable> createState() => _MyAvailableState();
}

class _MyAvailableState extends State<MyAvailable> {
  bool sort = true;

  int sortColumnIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("My Available"),
        centerTitle: true,
        backgroundColor: TColors.appbarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: DataTable(
                    sortColumnIndex: sortColumnIdx,
                    sortAscending: sort,
                    decoration: const BoxDecoration(color: Colors.white),
                    border: TableBorder.all(style: BorderStyle.none),
                    dividerThickness: 0,
                    columnSpacing: 2,
                    dataRowMinHeight: 38,
                    headingTextStyle: const TextStyle(color: Colors.white),
                    showBottomBorder: false,
                    columns: [
                      DataColumn(
                        label: const CustomCell(
                          text: 'OfficeNo',
                          color: TColors.buttonColor,
                          pad: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        onSort: (columnIndex, ascending) {
                          sort = !sort;
                          sortColumnIdx = columnIndex;
                          setState(() {});
                        },
                      ),
                      DataColumn(
                        label: const CustomCell(
                          text: 'Carpet',
                          color: TColors.buttonColor,
                          pad: EdgeInsets.symmetric(
                              horizontal: 47, vertical: 15),
                        ),
                        onSort: (columnIndex, ascending) {
                          sort = !sort;
                          sortColumnIdx = columnIndex;
                          setState(() {});
                        },
                      ),
                      DataColumn(
                        label: const CustomCell(
                          text: 'Floor',
                          color: TColors.buttonColor,
                          pad: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
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
                            text: 'OfficeNo',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'CarpetExact',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'Edit / Delete',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 17, vertical: 15),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          CustomCell(
                            text: 'OfficeNo',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'CarpetExact',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'Edit / Delete',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 17, vertical: 15),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          CustomCell(
                            text: 'OfficeNo',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'CarpetExact',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'Edit / Delete',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 17, vertical: 15),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          CustomCell(
                            text: 'OfficeNo',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'CarpetExact',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'Edit / Delete',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 17, vertical: 15),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          CustomCell(
                            text: 'OfficeNo',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'CarpetExact',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                        ),
                        DataCell(
                          CustomCell(
                            text: 'Edit / Delete',
                            color: TColors.textBackgroundColor,
                            pad: EdgeInsets.symmetric(
                                horizontal: 17, vertical: 15),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RoundedButton(
                  title: "Add",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
