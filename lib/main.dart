// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import "./QiListView.dart";

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '安卓切换任务管理时的任务名', home: QiStatefulApp());
  }
}

class QiStatefulApp extends StatefulWidget {
  const QiStatefulApp({super.key});

  @override
  State<QiStatefulApp> createState() => _QiStatefulAppState();
}

class _QiStatefulAppState extends State<QiStatefulApp> {
  double _listViewWidth = 0.1;
  double _listViewHeight = 0.1;
  String _centerString = 'Hello World';

  @override
  void intState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listViewWidth = MediaQuery.of(context).size.width;
    _listViewHeight = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar 展示任务'),
      ),
      body: Column(
        children: <Widget>[
          Text(_centerString),
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          ElevatedButton(
            onPressed: () => {
              print('press FlatButton'),
              setState(() {
                _centerString = 'Hello Flutter';
              })
            },
            child: Text('FlatButton'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
          GestureDetector(
            child: Text(
              'GestureDetector',
              style:
                  TextStyle(color: Colors.red, backgroundColor: Colors.yellow),
            ),
            onTap: () {
              print('GestureDetector');
            },
          ),
          Container(
            color: Colors.black12,
            width: _listViewWidth,
            height: _listViewHeight,
            child: ListView(
              children: <Widget>[
                // 列表条目
                ListTile(
                  // 标题
                  title: Text('ListTile1'),
                  // 子标题
                  subtitle: Text('subtile1'),
                  // 标题左侧的Widget
                  leading: Icon(Icons.security),
                  // 标题右侧的Widget
                  trailing: Icon(Icons.share),
                  onTap: () {
                    print('ListTile1');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('ListTile2'),
                  subtitle: Text('subtile2'),
                  leading: Icon(Icons.photo),
                  trailing: Icon(Icons.share),
                  onTap: () {
                    print('ListTile2');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('ListTile3'),
                  subtitle: Text('subtile3'),
                  leading: Icon(Icons.phone_iphone),
                  trailing: Icon(Icons.share),
                  onTap: () {
                    print('ListTile3');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('跳转到个人信息'),
                  leading: Icon(Icons.phone_android),
                  trailing: Icon(Icons.share),
                  onTap: () {
                    // 使用 Navigator.push 跳转到新的界面
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QiListViewPage('iOS Dev');
                        },
                      ),
                    ).then(
                      (onValue) {
                        print('回传的数据：$onValue');
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Icon(Icons.emoji_nature),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航栏的类型：fixed 固定，shifting 移动
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: '工作',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            label: '安全',
          ),
        ],
        // 点击事件
        onTap: (tappedIndex) {
          print('点击了 $tappedIndex');
        },
      ),
    );
  }
}

// 创建一个继承自Stateless的Widget
class QiStatelessApp extends StatelessWidget {
  // 重写build 方法，build 方法返回值为Widget类型，返回内容为屏幕上显示内容。
  @override
  Widget build(BuildContext context) {
    // MaterialApp 控制界面风格为安卓风格
    // CupertinoApp 界面风格为iOS 风格
    // Scaffold：脚手架 用于展示基础框架结构，如appBar、body、bottomNavigationBar
    return Scaffold(
      // AppBar：相当于iOS 的导航栏
      appBar: AppBar(
        // AppBar上的显示内容
        // Text 用于展示文本内容，相当于iOS中的UILabel
        title: Text('App Bar 展示内容'),
      ),
      // body：AppBar及BottomNavigationBar之间展示的内容
      // Center 是用于把子Widget 居中的Widget
      body: Center(
        child: Text('Hello World'),
      ),
      // 相当于iOS 中的UITabBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: '工作'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: '安全'),
        ],
        onTap: (tappedIndex) {
          print('tappedIndex：$tappedIndex');
        },
      ),
    );
  }
}
