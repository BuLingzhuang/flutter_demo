import 'package:flutter/material.dart';
import 'dart:async';
import 'package:english_words/english_words.dart';

class ListViewRoute extends StatefulWidget {
  @override
  _ListViewRouteState createState() {
    return new _ListViewRouteState();
  }
}

class _ListViewRouteState extends State<ListViewRoute> {
  static const loadingTag = "##loading##";
  var _refreshTimes = 0;
  var _itemList = <String>[loadingTag];

  @override
  void initState() {
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewRoute"),
      ),
      body: ListView.builder(
        itemCount: _itemList.length,
        itemBuilder: (BuildContext context, int index) {
          if (_itemList[index] == loadingTag) {
            //100条上限
            if (_itemList.length - 1 < 100) {
              //获取数据
              _retrieveData();
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            } else {
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          return ListTile(
            title: Text(
                "item : $index , _refreshTimes = $_refreshTimes , content = ${_itemList[index]}"),
          );
        },
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  void _retrieveData() {
    ++_refreshTimes;
    Future.delayed(Duration(seconds: 2)).then((e) {
      _itemList.insertAll(_itemList.length - 1,
          generateWordPairs().take(20).map((f) => f.asPascalCase).toList());
      setState(() {});
    });
  }
}
