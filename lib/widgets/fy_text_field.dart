
import 'package:flutter/material.dart';

class FYTextField extends StatelessWidget {

  FYTextField({this.controller, this.scrollController, this.onChanged}):super();
  final TextEditingController controller;
  final ScrollController scrollController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: Colors.grey[200],
            width: 1
          )
        ),
        child: TextField(
          controller: controller,
          scrollController: scrollController,
          decoration: InputDecoration.collapsed(hintText: "博客内容"),
          maxLines: 1000,
          style: TextStyle(
            fontSize: 14
          ),
          keyboardType: TextInputType.multiline,
          onChanged: onChanged
        ),
      );
  }
  
}