import 'package:flutter/material.dart';

class TestMainActivity extends StatefulWidget {
  @override
  _TestMainActivity createState() {
    return _TestMainActivity();
  }
}

class _TestMainActivity extends State<TestMainActivity> {
  var _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestMain"),
        leading: Builder(
          builder: (context) {
            return IconButton(
                icon: Icon(Icons.dashboard, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ], //导航栏右侧菜单
      ),
      drawer: new MyDrawer(),
      //抽屉
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.home, color: Colors.blue[900]),
                tooltip: "111",
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.business,
                  color: Colors.blue[700],
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.school,
                  color: Colors.blue[500],
                ),
                onPressed: () {}),
            SizedBox(),
            SizedBox(),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
        notchMargin: 6.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var clickCount = 0;

  void _onAdd() {
    ++clickCount;
    print("click fab curCount = $clickCount");
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/ic_coins.webp",
                        width: 80.0,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("Add account"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Manage accounts"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  const MyDrawer({Key key}) : super(key: key);
}
