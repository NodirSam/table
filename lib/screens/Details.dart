import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Details extends StatefulWidget {
  final int index;

  const Details(this.index);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List _elements = [];
  List _elements_en = [];
  List _elements_ru = [];
  List _elements_uz = [];

  Future readJson() async {
    final String response =
        await rootBundle.loadString("assets/data/elementsData.json");
    final data = json.decode(response);
    setState(() {
      _elements = data["elements"];
      print("axsxs ${_elements.length}");
      //print(response)
    });
  }

  Future readJsonEN() async {
    final String response =
    await rootBundle.loadString("assets/translations/en-US.json");
    final data = json.decode(response);
    setState(() {
      _elements_en = data["elements"];
      print("axsxs ${_elements_en.length}");
      //print(response)
    });
  }

  Future readJsonRU() async {
    final String response =
    await rootBundle.loadString("assets/translations/ru-RU.json");
    final data = json.decode(response);
    setState(() {
      _elements_ru = data["elements"];
      print("axsxs ${_elements_ru.length}");
      //print(response)
    });
  }

  Future readJsonUZ() async {
    final String response =
    await rootBundle.loadString("assets/translations/ru-RU.json");
    final data = json.decode(response);
    setState(() {
      _elements_uz = data["elements"];
      print("axsxs ${_elements_uz.length}");
      //print(response)
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("Element Details"),
      ),
      body: Center(
        child: Hero(
          tag: "${widget.index}",
          child: Card(
            color: _elements[widget.index]["category"] == "Alkali Metal"
                ? Colors.redAccent
                : _elements[widget.index]["category"] == "Reactive Nonmetal"
                    ? Colors.lightBlue
                    : _elements[widget.index]["category"] ==
                            "Alkaline Earth Metal"
                        ? Colors.lightGreen
                        : _elements[widget.index]["category"] ==
                                "Transition Metal"
                            ? Colors.yellow[700]
                            : _elements[widget.index]["category"] ==
                                    "Lanthanide"
                                ? Colors.deepOrange
                                : _elements[widget.index]["category"] ==
                                        "Actinide"
                                    ? Colors.pinkAccent
                                    : _elements[widget.index]["category"] ==
                                            "Post-transition Metal"
                                        ? Colors.purpleAccent
                                        : Colors.grey,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NAME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30, left: 10),
                          //height: 100,
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            _elements[widget.index]["name".tr()].toString().tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ).tr(),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //SYMBOL
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Symbol",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            _elements[widget.index]["symbol"].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //ATOMIC NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Atomic Number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            _elements[widget.index]["number"].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //ATOMIC MASS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Atomic mass",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            _elements[widget.index]["atomic_weight"].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //CATEGORY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            _elements[widget.index]["category"].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //EXTRACT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Extract",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
                          child: Text(
                            _elements[widget.index]["extract".tr()].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    // const Divider(
                    //   color: Colors.black38,
                    //   height: 2,
                    //   indent: 10,
                    //   endIndent: 10,
                    //   thickness: 3,
                    // ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
