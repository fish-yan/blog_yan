import 'package:blog_yan/model/blog.dart';
import 'package:blog_yan/utils/fy_event_bus.dart';
import 'package:blog_yan/utils/fy_routers.dart';
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BlogListPage extends StatefulWidget {
  final String category;

  BlogListPage(this.category) : super();

  @override
  _BlogListPageState createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<Blog> _list = List();
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _httpBlogList();
    bus.on("publish", (arg) {
      _httpBlogList();
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      child: _renderBody(),
      onRefresh: () {
        _page = 0;
        _httpBlogList();
      },
      onLoading: () {
        _page++;
        _httpBlogList();
      },
    );
  }
  Widget _renderBody() {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, i) {
              return _renderRow(i);
            }),
      ),
    );
  }

  Widget _renderRow(int i) {
    Blog model = _list[i];
    return GestureDetector(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                child: Text(
                  model.title,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: 300,
                  ),
                  child: Text(
                    model.des,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "发布于${model.date}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "作者：${model.author}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(FYRouters.blog, arguments: model);
      },
    );
  }

  _httpBlogList() {
    BmobQuery<Blog> query = BmobQuery();
    query.setSkip(10 * _page);
    query.setLimit(10);
    query.setOrder("-date");
    query.addWhereEqualTo("category", widget.category);
    query.queryObjects().then((List<dynamic> data) {
      _list = data.map((e) => Blog.fromJson(e)).toList();
      if (_list.isNotEmpty) {
        setState(() {});
      }
      _refreshController.loadComplete();
      _refreshController.refreshCompleted();
    });
  }

  @override
  void dispose() {
    super.dispose();
    bus.off("publish");
  }
}
