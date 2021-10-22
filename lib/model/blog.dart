
// import 'package:data_plugin/bmob/table/bmob_object.dart';
// import 'package:json_annotation/json_annotation.dart';
import 'package:leancloud_storage/leancloud.dart';

class Blog extends LCObject {
  String get title => this["title"];
  String get img => this["img"];
  String get subTitle => this["subTitle"];
  String get des => this["des"];
  String get blog => this["blog"];
  String get author => this["author"];
  String get date => this["date"];
  String get category => this["category"];
  set title(String value) => this["title"] = value;
  set img(String value) => this["img"] = value;
  set subTitle(String value) => this["subTitle"] = value;
  set des(String value) => this["des"] = value;
  set blog(String value) => this["blog"] = value;
  set author(String value) => this["author"] = value;
  set date(String value) => this["date"] = value;
  set category(String value) => this["category"] = value;

  Blog() : super("Blog");

}