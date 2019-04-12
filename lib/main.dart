import 'dart:async';

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
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class TestClass {
  num num1 = 10;
  int num2 = 20;
  int _num3 = 30; //私有变量

  int get num4 => _num3 + 1;

  TestClass(num num1) {
    this.num1 = num1;
  }

  //等效上面
  //  TestClass(this.num1);

  //另一种构造方法
  TestClass.createInstance(Map values) {
    num1 = values["num1"];
  }

  //重载加号
  TestClass operator +(TestClass tc) {
    return TestClass(this.num1 + tc.num1);
  }
}

//混合类
class MiA {
  show() {
    print("this is mixinsA");
  }
}

class MiB {}

class MiC extends MiB with MiA {}

//Mic().show() 打印this is mixinsA

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String s1 = "This is a \n test str";
  String s1r = r"This is a \n test str";
  var numD;
  dynamic dyObj = "test";
  var list = List(); //非固定长度、非固定类型
  var list1 = List<String>(); //固定类型
  var list2 = List<String>(3); //固定长度
  List<String> list3 = ["1", "2", "23232", "565656565", "5", "8989"]; //直接赋值
  var list4 = [1, 2, 3]; //固定类型的，后续不可添加其他类型值
  var list5 = [1, "str", 3.5, true]; //非固定类型直接赋值，后续可以添加其他类型值
  var list6 = <int>[1, 2, 3]; //泛型具体化
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
      //等效于上面
      list5.forEach((item) {
        print("item = $item");
      });
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

      print(list3 is List); //true
      print(list3 is! List); //false

      s1 ??= "ssssss"; //s1如果为空，则赋值ssssss给它
      var s1Len = s1?.length; //和kotlin类似的为空不做处理

      list3.toSet()..add("new1")..add("new2"); //级联运算符，拿着上一个返回的对象继续操作
      //等效于上面这一行
      var set3 = list3.toSet();
      set3.add("new1");
      set3.add("new2");

      print("a" == "a"); // true

      for (int item in list4) {
        print("list4 item = $item");
      }

      var add5 = makeAdder(5);
      var add10 = makeAdder(10);
      print(add5(1)); //6
      print(add10(1)); //11

      try {
        testException3();
      } on FormatException catch (e) {
        // 如果匹配不到FormatException，则会继续匹配
        print("catch format exception");
        print(e);
        rethrow; // 重新抛出异常
      } on Exception {
        // 匹配不到Exception，会继续匹配
        print("catch exception");
      } catch (e) {
        // 匹配所以类型的异常. e是异常对象，r是StackTrace对象，异常的堆栈信息
        print(e);
      } finally {
        print("this is finally");
      }

      var testClass1 = TestClass(111);
      var testClass2 = TestClass(222);
      //执行重载后的加号方法
      var testClassTotal = testClass1 + testClass2;
      print("testClassTotal.num1 = ${testClassTotal.num1}");

      _counter++;
    });
  }

  void streamTest(){
    Stream.fromFutures([]);
  }

  void delayedTest() {
    Future.delayed(new Duration(seconds: 2), () {
//      return "Hi, this is a delayed";
      throw OutOfMemoryError();
    }).then((str) {
      print(str);
    }).catchError((e) {
      print(e);
    }).whenComplete(() {
      //相当于Java的final
    });
  }

  //同上，两种catch的方式
  void delayedTest2() {
    Future.delayed(new Duration(seconds: 2), () {
//      return "Hi, this is a delayed";
      throw OutOfMemoryError();
    }).then((str) {
      print(str);
    }, onError: (e) {
      print(e);
    });
  }

  void delayedTestDouble() {
    //接收两个耗时操作，只要有一个异常，就出发catch
    Future.wait([
      Future.delayed(new Duration(seconds: 2), () {
        return "Hi, this is a delayed";
      }),
      Future.delayed(new Duration(seconds: 4), () {
//      return "Hi, this is a delayed";
        throw OutOfMemoryError();
      })
    ]).then((strList) {
      print(strList[0] + "\n" + strList[1]);
    }, onError: (e) {
      print(e);
    });
  }

  void delayedListTest() {
    firstDelay("A str").then((firstResult) {
      return secondDelay(firstResult);
    }).then((secondResult) {
      return thirdDelay(secondResult);
    }).then((thirdResult) {
      print(thirdResult);
    }).catchError((e) {
      print(e);
    });
  }

  //同上
  void delayedListTest2() {
    task() async {
      try {
        var firstResult = await firstDelay("A str 2");
        var secondResult = await secondDelay(firstResult);
        var thirdResult = await thirdDelay(secondResult);
        print(thirdResult);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<String> firstDelay(String str) {
    return Future.delayed(new Duration(seconds: 3), () {
      return str + "firstDelay";
    });
  }

  Future<String> secondDelay(String str) {
    return Future.delayed(new Duration(seconds: 3), () {
      return str + "secondDelay";
    });
  }

  Future<String> thirdDelay(String str) {
    return Future.delayed(new Duration(seconds: 3), () {
      return str + "thirdDelay";
    });
  }

  void getMsg(String name, {int age = 25, String sex = "男"}) {
    print("name = $name , age = $age , sex = $sex");
  }

  void travel({String from = "china", String to = "usa"}) {
    print("From $from to $to");
  }

  // list和map的默认值需要用const修饰
  void animals(
      [List<String> names = const ["cat", "dog"],
      Map<String, String> nameMap = const {"c": "cat", "d": "dog"}]) {
    print("animals: $names");
    print("nameMap: $nameMap");
  }

  //闭包例子
  Function makeAdder(num) {
    return (addNum) {
      return addNum + num;
    };
  }

  testException2() {
    throw Exception("test exception");
  }

  //等效于上面
  void testException3() => throw Exception("test exception");

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
