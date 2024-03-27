import 'package:leancloud_storage/leancloud.dart';

class Category extends LCObject {

  String get category => this["category"];

  set category(String value) => this["category"] = value;

  Category() : super("Category");

}