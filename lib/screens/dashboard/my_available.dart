import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/main.dart';
import 'package:task/widgets/custom_textfield.dart';
import 'package:task/widgets/rounded_button.dart';
import '../../app/constants/color.dart';
import '../../widgets/custom_cell.dart';

class MyAvailable extends StatefulWidget {
  MyAvailable({super.key});

  @override
  State<MyAvailable> createState() => _MyAvailableState();
}

class _MyAvailableState extends State<MyAvailable> {
  PostgrestResponse? result;
  List<dynamic>? datalist;

  Future<List> _getAllData() async {
    result = await supabase.from('available_office').select().execute();
    datalist = result?.data as List;
    print(datalist?.length);
    return datalist!;
  }

  bool sort = true;

  int sortColumnIdx = 0;
  late Future getAllData;

  void _sort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        datalist?.sort((a, b) => a['officeno'].compareTo(b['officeno']));
      } else {
        datalist?.sort((a, b) => b['officeno'].compareTo(a['officeno']));
      }
    }
    if (columnIndex == 1) {
      if (ascending) {
        datalist?.sort((a, b) =>
            a['sqftexact'].toString().compareTo(b['sqftexact'].toString()));
      } else {
        datalist?.sort((a, b) =>
            b['sqftexact'].toString().compareTo(a['sqftexact'].toString()));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAllData = _getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("My Available"),
        centerTitle: true,
        backgroundColor: TColors.appbarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            width: MediaQuery.sizeOf(context).width,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ));
                      } else if (snapshot.hasData) {
                        return DataTable(
                          sortColumnIndex: sortColumnIdx,
                          sortAscending: sort,
                          decoration: const BoxDecoration(color: Colors.white),
                          border: TableBorder.all(style: BorderStyle.none),
                          dividerThickness: 0,
                          columnSpacing: 2,
                          dataRowMinHeight: 38,
                          headingTextStyle:
                              const TextStyle(color: Colors.white),
                          showBottomBorder: false,
                          columns: [
                            DataColumn(
                              label: const CustomCell(
                                text: 'OfficeNo',
                                color: TColors.buttonColor,
                              ),
                              onSort: (columnIndex, ascending) {
                                setState(() {
                                  sort = !sort;
                                  sortColumnIdx = columnIndex;
                                });
                                _sort(columnIndex, sort);
                              },
                            ),
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
                                _sort(columnIndex, sort);
                              },
                            ),
                            const DataColumn(
                              label: CustomCell(
                                text: 'Floor',
                                color: TColors.buttonColor,
                              ),
                            ),
                          ],
                          rows: [
                            if (datalist != null && datalist!.isNotEmpty)
                              ...datalist!.map((rowData) {
                                int availableSerial =
                                    rowData['availableserial'];

                                return DataRow(cells: [
                                  DataCell(
                                    CustomCell(
                                      text: rowData['officeno'],
                                      color: TColors.textBackgroundColor,
                                    ),
                                  ),
                                  DataCell(
                                    CustomCell(
                                      text: rowData['sqftexact'].toString(),
                                      color: TColors.textBackgroundColor,
                                    ),
                                  ),
                                  DataCell(
                                    InkWell(
                                      onTap: () => _showAlertDialog(
                                          context,
                                          "Edit/Delete Data",
                                          "Edit",
                                          "Delete",
                                          availableSerial),
                                      child: const CustomCell(
                                        text: 'Edit / Delete',
                                        color: TColors.textBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ]);
                              }),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text("Error while fetching data"),
                        );
                      }
                    }),
                const SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: RoundedButton(
                    title: "Add",
                    onTap: () =>
                        _showAlertDialog(context, "Add Data", "Cancel", "Add"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext context, String text, String btn1, String btn2,
      [int? availableSerial]) async {
    final addForm = GlobalKey<FormState>();
    final TextEditingController officeNoController = TextEditingController();
    final TextEditingController floorController = TextEditingController();
    final TextEditingController sqftExactController = TextEditingController();
    // final TextEditingController builtUpExactController =
    // TextEditingController();
    final TextEditingController sqftRateController = TextEditingController();
    // final TextEditingController builtUpRateController = TextEditingController();
    final TextEditingController fromDateController = TextEditingController();
    // final TextEditingController floorLevelController = TextEditingController();
    // final TextEditingController sqftController = TextEditingController();
    // final TextEditingController builtUpController = TextEditingController();
    final TextEditingController rentMonthsFromController =
        TextEditingController();
    final TextEditingController rentMonthUptoController =
        TextEditingController();
    DateTime selectedDate = DateTime.now();

    List<DropdownMenuItem> items = ["item1", "item2", "item3", "item4"]
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();

    var selectedItem = "item1";
    String? sellingType;
    if (availableSerial != null) {
      PostgrestResponse editResult = await supabase
          .from('available_office')
          .select()
          .eq('availableserial', availableSerial)
          .execute();
      final editRes = editResult.data[0];
      officeNoController.text = editRes['officeno'].toString();
      floorController.text = editRes['floor'].toString();
      sqftRateController.text = editRes['sqftrate'].toString();
      sqftExactController.text = editRes['sqftexact'].toString();
      fromDateController.text = editRes['fromdate'].toString();
      rentMonthsFromController.text = editRes['onrentmonthsfrom'].toString();
      rentMonthUptoController.text = editRes['onrentmonthupto'].toString();
    }
    void changeRadio(value) {
      setState(() {
        sellingType = value;
      });
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }

      fromDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    }

    if (mounted) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(text, textAlign: TextAlign.center),
          actions: [
            ElevatedButton(
              onPressed: () async {
                if (btn1 == "Cancel") {
                  Navigator.pop(context);
                } else {
                  Map<String, dynamic> data = {
                    'userid': 1,
                    'locationid': 1,
                    'officeno': officeNoController.text,
                    'sqftexact': sqftExactController.text ?? 0,
                    'floor': floorController.text ?? 0,
                    'onoutright': true,
                    'onrent': false,
                    'fromdate': fromDateController.text,
                    'sqftrate': sqftRateController.text,
                    'onrentmonthsfrom': rentMonthsFromController.text,
                    'onrentmonthupto': rentMonthUptoController.text,
                  };
                  try {
                    final response = await supabase
                        .from('available_office')
                        .update(data)
                        .eq('availableserial', availableSerial)
                        .execute();
                    log(response.status.toString(), name: "EDIT STATUS");
                    if (response.status == 204) {
                      await _getAllData();
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data Updated Successfully'),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error Updating  Data $e'),
                        ),
                      );
                    }
                  }
                }
                ;
              },
              child: Text(btn1),
            ),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> data = {
                  'userid': 1,
                  'locationid': 1,
                  'officeno': officeNoController.text,
                  'sqftexact': sqftExactController.text ?? 0,
                  'floor': floorController.text ?? 0,
                  'onoutright': true,
                  'onrent': false,
                  'fromdate': fromDateController.text,
                  'sqftrate': sqftRateController.text,
                  'onrentmonthsfrom': rentMonthsFromController.text,
                  'onrentmonthupto': rentMonthUptoController.text,
                };

                if (btn2 == "Add") {
                  if (addForm.currentState!.validate() == true) {
                    try {
                      final response = await supabase
                          .from('available_office')
                          .insert(data)
                          .execute();
                      log(response.status.toString(), name: "STATUS");
                      if (response.status == 201) {
                        if (mounted) {
                          await _getAllData();
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data inserted Successfully'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      }
                    } catch (e) {
                      if (mounted) {
                        log(e.toString(), name: "ADD DATA ERROR");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error Inserting Data $e'),
                          ),
                        );
                      }
                    }
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are You Sure?"),
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              PostgrestResponse res = await supabase
                                  .from('available_office')
                                  .delete()
                                  .eq('availableserial', availableSerial)
                                  .execute();
                              if (res.status == 204) {
                                await _getAllData();
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Data Deleted successfully")));
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Error in deleting data")));
                            }
                          },
                          child: const Text("Yes"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text(btn2),
            ),
          ],
          content: Form(
            key: addForm,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: officeNoController,
                          hintText: "Office no.",
                          validationText: "Please enter office number",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: sqftExactController,
                          hintText: "Carpet Exact",
                          validationText: "Please enter carpet exact",
                          textFormatter: FilteringTextInputFormatter.digitsOnly,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text("Radio:"),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        StatefulBuilder(
                          builder: (context, setState) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: "OnOutRight",
                                    groupValue: sellingType,
                                    onChanged: (value) {
                                      setState((){
                                        sellingType = value;
                                      });
                                    },
                                    fillColor: MaterialStateProperty.all(
                                        TColors.buttonColor),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text("OnOutRight"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "onSale",
                                    groupValue: sellingType,
                                    onChanged: (value) {
                                        setState((){
                                          sellingType = value;
                                        });
                                    },
                                    fillColor: MaterialStateProperty.all(
                                        TColors.buttonColor),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text("OnSale"),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: fromDateController,
                    onTap: () => _selectDate(context),
                    readOnly: true,
                    validator: (value) =>
                        value!.isEmpty ? "PLease select date" : null,
                    decoration: const InputDecoration(
                      hintText: 'Select Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                            controller: sqftRateController,
                            hintText: "Carpet Rate",
                            validationText: "Please enter carpet rate",
                            keyboardType: TextInputType.number,
                            textFormatter:
                                FilteringTextInputFormatter.digitsOnly),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: floorController,
                          hintText: "Floor",
                          validationText: "Please enter floor",
                          keyboardType: TextInputType.number,
                          textFormatter: FilteringTextInputFormatter.allow(
                            RegExp(r'^10|[0-9]$'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: rentMonthsFromController,
                          hintText: "Rent From",
                          validationText: "Please enter rent from month",
                          textFormatter: FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9]{1,2}$'),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: rentMonthUptoController,
                          hintText: "Rent Upto",
                          validationText: "Please enter Rent upto",
                          keyboardType: TextInputType.number,
                          textFormatter: FilteringTextInputFormatter.digitsOnly,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField(
                      value: selectedItem,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      items: items,
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
