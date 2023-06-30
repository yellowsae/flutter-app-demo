import 'package:flutter/material.dart';
// main (runApp())  =>  MaterialApp()  =>  HomePage() => Scaffold() - AppBar() - Drawer() - body - FloatingActionButton()

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Title Demo5",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: HomePage(title: 'Flutter Home Demo5 Title'),
    );
  }
}

class HomePage extends StatefulWidget {
  // 接受参数 title
  const HomePage({super.key, required this.title});

  // final 修饰的变量，只能在构造函数中初始化
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 具有状态的 Widget

  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times:"),
            Text(
              "$_count",
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      drawer: Icon(Icons.menu),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
