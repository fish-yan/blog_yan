import 'package:blog_yan/utils/fy_routers.dart';
import 'package:data_plugin/bmob/bmob.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bmob.init("https://api2.bmob.cn", "77088ce1637804d97be523f42e14d844", "d7775dba9949a9346dc58f95b005c484");
    
    return new MaterialApp(
      title: 'BlogYan',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: FYRouters.routers(context),
    );
  }
}
