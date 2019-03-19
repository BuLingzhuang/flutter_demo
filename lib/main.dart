import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final finStr = "111";
  static const constStr = 222;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String s1 = "This is a \n test str";
  String s1r = r"This is a \n test str";
  var numD;
  dynamic dyObj = "test";
  var list = List(); //非固定长度、非固定类型
  var list1 = List<String>(); //固定类型
  var list2 = List<String>(3); //固定长度
  List<String> list3 = [
    "1",
    "2",
    "3",
    "23232",
    "565656565",
    "4",
    "5",
    "8989"
  ]; //直接赋值
  var list4 = [1, 2, 3]; //固定类型的，后续不可添加其他类型值
  var list5 = [1, "str", 3.5, true]; //非固定类型直接赋值，后续可以添加其他类型值
  //list有序，可重复
  //set无序，不可重复
  //map无序，key唯一
  var map0 = Map();
  var map1 = {"a": "item a", "b": "item b", "c": "item c"};
  var map2 = Map<String, String>();

  void _incrementCounter() {
    setState(() {
//      getMsg("卜令壮");
//      getMsg("张三", age: 13);
//      getMsg("李四", age: 18, sex: "女");
      print("s1 = $s1");
      print("s1r = $s1r");
      //初始化对应类型后不可再变更为其他类型
      numD = 10.5;
      //可变类型的变量，感觉意义不大，容易造成逻辑混乱
      dyObj = 12;

      list.add("test");
      list[0] = "test1";

      print("map1 a = ${map1["a"]}");
      map2.addAll({"item1": "111", "item2": "222"});
      list5.forEach((item) => print("item = $item"));
      map1.forEach(
          (itemK, itemV) => print("itemKey = $itemK itemValue = $itemV"));
      //遍历处理,返回结果List
      var list3Upper = list3.map((item) => item.toUpperCase());
      //过滤处理，返回结果List
      var list3Short = list3.where((item) => item.length < 2);
      //判断集合方法，any一个满足就为true，every全部满足才为true
      print(list3.any((item) => item.length < 2)); //true
      print(list3.every((item) => item.length < 2)); //false

      print(14 / 5); // 2.8
      print(14 ~/ 5); // 2
      print(14 % 5); // 4

      print("a" == "a"); // true

      _counter++;
    });
  }

  void getMsg(String name, {int age = 25, String sex = "男"}) {
    print("name = $name , age = $age , sex = $sex");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
