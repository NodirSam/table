import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_widget/zoom_widget.dart';

import 'Details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _elements = [];


  Future readJson() async {
    final response = await rootBundle.loadString("assets/data/elementsData.json");
    final data =json.decode(response);
    setState(() {
      _elements = data["elements"];
      print("axsxs ${_elements.length}");
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
      //backgroundColor: const Color(0xFF082032),
      backgroundColor: Color.fromRGBO(117, 117, 117, 1),
      //backgroundColor: Colors.grey[900],
      //backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.black12,
        title: const Text("Periodic Table", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 60,
                child: MaterialButton(
                  color: Colors.orange,
                  onPressed: (){
                    context.setLocale(Locale("en", "US"));
                  },
                  child: Text("En"),
                ),
              ),
              Container(
                height: 40,
                width: 60,
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: (){
                    context.setLocale(Locale("ru", "RU"));
                  },
                  child: Text("Ru"),
                ),
              ),
              Container(
                height: 40,
                width: 60,
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: (){
                    context.setLocale(Locale("uz", "UZ"));
                  },
                  child: Text("Uz"),
                ),
              ),
            ],
          )
        ],
      ),
      body: Zoom(
        maxZoomWidth: 1800,
        maxZoomHeight: 1800,
        opacityScrollBars: 0.9,
        scrollWeight: 10.0,
        centerOnScale: true,
        enableScroll: true,
        doubleTapZoom: true,
        zoomSensibility: 0.05,
        //maxScale: 6,

        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30, top: 2),
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 900,
            child: GridView.builder(
                padding: const EdgeInsets.only(left: 3, bottom: 30, right: 3),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10,crossAxisSpacing: 1,mainAxisSpacing: 1,),
                scrollDirection: Axis.horizontal,
                itemCount: _elements.length,
                itemBuilder: (context,index) {
                  return GestureDetector(
                    onTap:(){
                      Navigator.push(context, PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 400),
                        transitionsBuilder: (BuildContext context, Animation<double>_anim,
                            Animation<double>_anim2,Widget child){
                          _anim= CurvedAnimation(parent: _anim, curve: Curves.fastOutSlowIn);
                          return ScaleTransition(scale: _anim,
                            child: child,);
                        },

                        pageBuilder: (BuildContext context, Animation<double>_anim,
                            Animation<double>_anim2) {
                          return  Details(index);
                        },
                      ));
                    },
                    child: _elements[index] != null? Hero(
                      tag: "$index",
                      child: Card(
                        color: _elements[index]["category"] == "Alkali Metal"
                            ? Colors.redAccent
                            : _elements[index]["category"] == "Reactive Nonmetal"
                            ? Colors.lightBlue
                            : _elements[index]["category"] == "Alkaline Earth Metal"
                            ? Colors.lightGreen
                            : _elements[index]["category"] == "Transition Metal"
                            ? Colors.yellow[700]
                            : _elements[index]["category"] == "Lanthanide"
                            ? Colors.deepOrange
                            : _elements[index]["category"] == "Actinide"
                            ? Colors.pinkAccent
                            : _elements[index]["category"] == "Post-transition Metal"
                            ? Colors.purpleAccent
                            : Colors.grey,



                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(padding: const EdgeInsets.only(top: 2, left: 3,), child: Text(""+_elements[index]["number"].toString(),style: TextStyle(fontSize:Theme.of(context).textTheme.bodyLarge!.fontSize,color: Colors.white),)),
                              Container(padding: const EdgeInsets.only(top: 2, left: 25,),child: Text(_elements[index]["symbol"],style: const TextStyle(fontSize:24,color: Colors.white ),)),
                              Container(padding: const EdgeInsets.only(top: 2, left: 5,),child: FittedBox(child: Text(_elements[index]["name"],style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize, color: Colors.white),))),

                            ],
                          ),
                        ),
                      ),
                    ) : const SizedBox(height: 100, width: 100,),
                  );}
            ),
          ),
        ),
      ),
      // body:
      // InteractiveViewer(
      //   panEnabled: false, // Set it to false to prevent panning.
      //   boundaryMargin: EdgeInsets.zero,
      //   minScale: 0.01,
      //   maxScale: 4,
      //
      //   child: SingleChildScrollView(
      //     padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30, top: 2),
      //     scrollDirection: Axis.vertical,
      //     child: SizedBox(
      //       height: 900,
      //       child: GridView.builder(
      //           padding: const EdgeInsets.only(left: 3, bottom: 30, right: 3),
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10,crossAxisSpacing: 1,mainAxisSpacing: 1,),
      //           scrollDirection: Axis.horizontal,
      //           itemCount: _elements.length,
      //           itemBuilder: (context,index) {
      //             return GestureDetector(
      //               onTap:(){
      //                 Navigator.push(context, PageRouteBuilder(
      //                   transitionDuration: const Duration(milliseconds: 400),
      //                   transitionsBuilder: (BuildContext context, Animation<double>_anim,
      //                       Animation<double>_anim2,Widget child){
      //                     _anim= CurvedAnimation(parent: _anim, curve: Curves.fastOutSlowIn);
      //                     return ScaleTransition(scale: _anim,
      //                       child: child,);
      //                   },
      //
      //                   pageBuilder: (BuildContext context, Animation<double>_anim,
      //                       Animation<double>_anim2) {
      //                     return  Details(index);
      //                   },
      //                 ));
      //               },
      //               child: _elements[index] != null? Hero(
      //                 tag: "$index",
      //                 child: Card(
      //                   color: _elements[index]["category"] == "Alkali Metal"
      //                       ? Colors.redAccent
      //                       : _elements[index]["category"] == "Reactive Nonmetal"
      //                       ? Colors.lightBlue
      //                       : _elements[index]["category"] == "Alkaline Earth Metal"
      //                       ? Colors.lightGreen
      //                       : _elements[index]["category"] == "Transition Metal"
      //                       ? Colors.yellow[700]
      //                       : _elements[index]["category"] == "Lanthanide"
      //                       ? Colors.deepOrange
      //                       : _elements[index]["category"] == "Actinide"
      //                       ? Colors.pinkAccent
      //                       : _elements[index]["category"] == "Post-transition Metal"
      //                       ? Colors.purpleAccent
      //                       : Colors.grey,
      //
      //
      //
      //                   child: SizedBox(
      //                     width: 100,
      //                     height: 100,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Container(padding: const EdgeInsets.only(top: 2, left: 3,), child: Text(""+_elements[index]["number"].toString(),style: TextStyle(fontSize:Theme.of(context).textTheme.bodyLarge!.fontSize,color: Colors.white),)),
      //                         Container(padding: const EdgeInsets.only(top: 2, left: 25,),child: Text(_elements[index]["symbol"],style: const TextStyle(fontSize:24,color: Colors.white ),)),
      //                         Container(padding: const EdgeInsets.only(top: 2, left: 5,),child: FittedBox(child: Text(_elements[index]["name"],style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize, color: Colors.white),))),
      //
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ) : const SizedBox(height: 100, width: 100,),
      //             );}
      //       ),
      //     ),
      //   ),
      // )
    );
  }

}

