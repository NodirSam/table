class ElementsData {
  int? number;
  String? name;
  String? symbol;
  String? extract;
  String? source;
  String? category;
  String? atomicWeight;
  List<int>? colors;

  ElementsData(
      {required this.number,
      required this.name,
      required this.symbol,
      required this.extract,
      required this.source,
      required this.category,
      required this.atomicWeight,
      required this.colors});

  ElementsData.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    symbol = json['symbol'];
    extract = json['extract'];
    source = json['source'];
    category = json['category'];
    atomicWeight = json['atomic_weight'];
    colors = json['colors'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['symbol'] = symbol;
    data['extract'] = extract;
    data['source'] = source;
    data['category'] = category;
    data['atomic_weight'] = atomicWeight;
    data['colors'] = colors;
    return data;
  }
}

// class ElementsData {
//   List<Elements>? elements;
//
//   ElementsData({required this.elements});
//
//   ElementsData.fromJson(Map<String, dynamic> json) {
//     if (json['elements'] != null) {
//       elements = <Elements>[];
//       json['elements'].forEach((v) {
//         elements?.add(new Elements.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.elements != null) {
//       data['elements'] = this.elements?.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Elements {
//   int? number;
//   String? name;
//   String? symbol;
//   String? extract;
//   String? source;
//   String? category;
//   String? atomicWeight;
//   List<int>? colors;
//
//   Elements(
//       {required this.number,
//       required this.name,
//       required this.symbol,
//       required this.extract,
//       required this.source,
//       required this.category,
//       required this.atomicWeight,
//       required this.colors});
//
//   Elements.fromJson(Map<String, dynamic> json) {
//     number = json['number'];
//     name = json['name'];
//     symbol = json['symbol'];
//     extract = json['extract'];
//     source = json['source'];
//     category = json['category'];
//     atomicWeight = json['atomic_weight'];
//     colors = json['colors'].cast<int>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['number'] = this.number;
//     data['name'] = this.name;
//     data['symbol'] = this.symbol;
//     data['extract'] = this.extract;
//     data['source'] = this.source;
//     data['category'] = this.category;
//     data['atomic_weight'] = this.atomicWeight;
//     data['colors'] = this.colors;
//     return data;
//   }
// }
