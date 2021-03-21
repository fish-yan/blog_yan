import 'dart:io';

import 'package:blog_yan/model/blog.dart';
import 'package:blog_yan/model/category.dart';
import 'package:blog_yan/utils/fy_event_bus.dart';
import 'package:blog_yan/utils/fy_routers.dart';
import 'package:blog_yan/widgets/fy_perview.dart';
import 'package:blog_yan/widgets/fy_text_field.dart';
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class BlogWritePage extends StatefulWidget {
  @override
  _BlogWritePageState createState() => _BlogWritePageState();
}

class _BlogWritePageState extends State<BlogWritePage> {
  TextEditingController _controller = TextEditingController();

  Blog _blog = Blog();

  String _categoryValue = "iOS";

  List<Category> _categorys = List();

  @override
  void initState() {
    super.initState();
    _httpGetCategorys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新建博客"),
          actions: [
            IconButton(
              icon: Text("发布"),
              onPressed: () {
                // _httpAddBlog();
                _uploadBlog();
              },
            )
          ],
        ),
        body: _renderBody());
  }

  Widget _renderBody() {
    var width = MediaQuery.of(context).size.width;
    Widget header = Container(
      height: 100,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              "主题：",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                border: InputBorder.none,
              ),
              onChanged: (text) {
                _blog.title = text;
              },
            ),
          ),
          _renderCategory(),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: width > 1000
                ? null
                : RaisedButton(
                    color: Colors.deepPurple,
                    child: Text(
                      "预览",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        FYRouters.blogPreview,
                        arguments: _controller.text,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
    Widget desWidget = Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Colors.grey[200], width: 1)),
      child: TextField(
          decoration: InputDecoration.collapsed(hintText: "博客描述"),
          maxLength: 300,
          maxLines: 5,
          style: TextStyle(fontSize: 14),
          keyboardType: TextInputType.multiline,
          onChanged: (text) {
            _blog.des = text;
          }),
    );
    ;
    Widget content;
    if (width > 1000) {
      content = Row(
        children: [
          Expanded(
            child: FYTextField(
              controller: _controller,
              onChanged: (text) {
                setState(() {});
              },
            ),
            flex: 1,
          ),
          Expanded(
            child: FYPreview(
              _controller.text,
            ),
            flex: 1,
          ),
        ],
      );
    } else {
      content = FYTextField(
        controller: _controller,
      );
    }

    return Container(
      child: Column(
        children: [
          header,
          desWidget,
          Expanded(
            child: content,
          )
        ],
      ),
    );
  }

  _renderCategory() {
    return Container(
      padding: EdgeInsets.all(10),
      child: DropdownButton<String>(
        value: _categoryValue,
        onChanged: (String value) {
          setState(() {
            _categoryValue = value;
          });
        },
        items: _categorys.map((e) {
          return DropdownMenuItem(
            value: e.category,
            child: Text(
              e.category,
              textAlign: TextAlign.center,
            ),
          );
        }).toList(),
      ),
    );
  }

  _httpGetCategorys() {
    BmobQuery<Category> query = BmobQuery();
    query.queryObjects().then((value) {
      _categorys = value.map((e) => Category.fromJson(e)).toList();
      setState(() {});
    });
  }

  _httpAddBlog() {
    _blog.author = "薛焱";
    _blog.date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
    _blog.blog = _controller.text;
    _blog.category = _categoryValue;
    _blog.save().then((value) {
      Toast.show("发布成功", context);
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pop();
        bus.emit("publish");
      });
    });
  }

  _uploadBlog() {
    Directory directory = Directory("_post");
    directory.listSync().forEach((element) {
      File file = File(element.path);
      var a = file.readAsStringSync();
      print(a);
    });
  }
}
