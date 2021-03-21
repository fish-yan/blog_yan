
import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';
part 'blog.g.dart';

@JsonSerializable()

class Blog extends BmobObject {
  String title = "";
  String subTitle = "";
  String des = "";
  String blog = "";
  String author = "";
  String date = "";
  String category = "";

  Blog();

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}