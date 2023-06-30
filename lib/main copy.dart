import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 继承  StatelessWidget 无状态的组件
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // override 重写 Widget 的 build 方法 (来源于 StatelessWidget)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Title
      title: 'Flutter Demo',
      // 主题
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 继承  StatefulWidget 有状态的组件
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // final 修饰的变量，只能在构造函数中初始化
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 继承  State 有状态的组件  => 能够改变的组件中的数据
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold 是 Material 库中提供的页面脚手架，包含导航栏和 Body 属性
    return Scaffold(
      // appBar 是页面的头部
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title 属性是头部的标题
        title: Text(widget.title),
      ),
      // body 属性是页面的主体部分
      body: Center(
        // Column 是一个将子组件在垂直方向上排列的组件
        // Row 是一个将子组件在水平方向上排列的组件
        child: Column(
          // mainAxisAlignment 属性是垂直方向的对齐方式  MainAxisAlignment.center 居中对齐
          mainAxisAlignment: MainAxisAlignment.center,
          // children 属性是子组件数组 <Widget>[], 里面放的是子组件 Widget 翻译为物料
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              // 获取 _counter 的值
              '$_counter',
              // 字体样式
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // 浮动按钮
      floatingActionButton: FloatingActionButton(
        // 点击事件 _incrementCounter
        onPressed: _incrementCounter,
        // 提示
        tooltip: 'Increment',
        // 图标
        child: const Icon(Icons.add),
      ),
    );
  }
}
