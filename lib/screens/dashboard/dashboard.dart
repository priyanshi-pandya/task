import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/widgets/rounded_button.dart';

import '../../app/constants/color.dart';
import 'view_available.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final startNoController = TextEditingController();
  final endNoController = TextEditingController();

  var sellingType;

  List<DropdownMenuItem> items = ["item1", "item2", "item3", "item4"]
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ),
      )
      .toList();

  var selectedItem;

  void changeRadio(value) {
    setState(() {
      sellingType = value;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedItem = "item1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: TColors.appbarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedButton(
                title: "View - Available",
                onTap: () => Navigator.pushNamed(
                  context,
                  '/ViewAvailable',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                title: "View - Required",
                onTap: () => Navigator.pushNamed(
                  context,
                  '/ViewRequired',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                title: "My - Available",
                onTap: () => Navigator.pushNamed(
                  context,
                  '/MyAvailable',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                title: "My - Required",
                onTap: () => Navigator.pushNamed(
                  context,
                  '/MyAvailable',
                ),
              ),

              const SizedBox(
                height: 70,
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
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text("Carpet"),
                  const SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: TextField(
                      controller: startNoController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("^[0-9]{1,4}\$")),
                      ],
                      decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        hintText: "mCarpetFrom",
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text("to"),
                  const SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: TextField(
                      controller: endNoController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("^[0-9]{1,4}\$")),
                      ],
                      decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        hintText: "mCarpetUpto",
                        fillColor: TColors.textBackgroundColor,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "OnOutRight",
                              groupValue: sellingType,
                              onChanged: (value) => changeRadio(value),
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
                              onChanged: (value) => changeRadio(value),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
