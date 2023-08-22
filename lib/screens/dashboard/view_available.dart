import 'package:flutter/material.dart';

import '../../app/constants/color.dart';
import '../../widgets/custom_cell.dart';

class ViewAvailable extends StatelessWidget {
  const ViewAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("View Available"),
        centerTitle: true,
        backgroundColor: TColors.appbarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: DataTable(
            decoration: const BoxDecoration(color: Colors.white),
            border: TableBorder.all(style: BorderStyle.none),
            dividerThickness: 0,
            columnSpacing: 8,
            dataRowMinHeight: 38,
            headingTextStyle: const TextStyle(color: Colors.white),
            showBottomBorder: false,

            columns: const [
              DataColumn(
                label: CustomCell(
                  text: 'Carpet',
                  color: TColors.buttonColor,
                  pad: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
              ),
              DataColumn(
                label: CustomCell(
                  text: 'Rate',
                  color: TColors.buttonColor,
                  pad: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
              DataColumn(
                label: CustomCell(
                  text: 'Floor',
                  color: TColors.buttonColor,
                  pad: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
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
    );
  }
}
