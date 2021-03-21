import 'package:blog_yan/model/category.dart';
import 'package:blog_yan/pages/blog_list_page.dart';
import 'package:blog_yan/utils/fy_routers.dart';
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:flutter/material.dart';

class BlogListMainPage extends StatefulWidget {
  @override
  _BlogListMainPageState createState() => _BlogListMainPageState();
}

class _BlogListMainPageState extends State<BlogListMainPage> {
  List<Category> _categorys = List();

  @override
  void initState() {
    super.initState();
    _httpGetCategorys();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _categorys.length,
      child: Scaffold(
      appBar: AppBar(
        title: Text("博客列表"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(FYRouters.blogWrite);
            },
          )
        ],
        bottom: TabBar(
          tabs: _categorys.map((e) => Tab(text:e.category)).toList(),
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        children: _categorys.map((e) => BlogListPage(e.category)).toList(),
      ),
    ),
    );
  }

  _httpGetCategorys() {
    BmobQuery<Category> query = BmobQuery();
    query.queryObjects().then((value) {
      _categorys = value.map((e) => Category.fromJson(e)).toList();
      setState(() {
        
      });
    });
  }
}
