import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Rectangle {
  double height;
  double width;
  double _scaledArea;

  Rectangle({this.height, this.width});

  Rectangle.square({double squareSide})
      : height = squareSide,
        width = squareSide;

  set scaledArea(double scale) => _scaledArea = height * width * scale;
  double get scaledArea => _scaledArea;
}

class Circle {
  double _pi = 3.14;
  double radius;

  Circle(this.radius);

  factory Circle.check(double radius) {
    if (radius < 0.0) {
      return null;
    }
    return Circle(radius);
  }

  double get length => 2 * _pi * radius;
}

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

Function makeAdderNamed({int addBy, int multiplyBy = 1}) {
  return (int i) => (addBy + i) * multiplyBy;
}

class Animal {
  int legs;
  Animal(this.legs);
}

class Dog {
  bark() {
    print('bark!');
  }
}

class Cat {
  meow() {
    print('meow!');
  }
}

class CatDog extends Animal with Cat, Dog {
  CatDog(legs) : super(legs);
}

var list = [1, 2, 3];
var sett = {4, 5, 6};
var addedList = [...list, ...sett];
var map = {
  'img': 'imgcache',
  'video': 'videocache',
  'json': 'jsoncache',
};

void lab1() {
  var rect = Rectangle.square(squareSide: 20.0);
  rect.scaledArea = 2.0;
  print(rect.scaledArea);

  var circ = Circle.check(5.0);
  var nullCirc = Circle.check(-2.0);
  nullCirc ??= Circle.check(2.0);
  print(circ.length);
  print(nullCirc.length);

  var add2 = makeAdder(2);
  var add4 = makeAdderNamed(addBy: 4);
  print(add2(3));
  print(add4(3));

  var catDog = CatDog(4);
  print('CatDog has ' + catDog.legs.toString() + ' legs!');
  catDog.meow();
  catDog.bark();

  print(addedList);
  print(map['json']);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ivan Burlakov - Lab 1',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Ivan Burlakov - Lab 1'),
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: lab1,
        tooltip: 'Increment',
        child: Icon(Icons.input),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
