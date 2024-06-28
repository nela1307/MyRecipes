import 'dart:convert';

class Category {

  String strCategory;

  Category({required this.strCategory});

  factory Category.fromJson(Map<String,dynamic> json) => Category(
    strCategory: json["strCategory"],
  );

  factory Category.fromRawJson(String s) => Category.fromJson(json.decode(s));

}