import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ivan Burlakov - Lab 4',
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          "/": (ctx) => Parent(),
          "/child": (ctx) => Child(checkbox: settings.arguments),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}

class Parent extends StatefulWidget {
  Parent({Key key = const Key("Child")}) : super(key: key);

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  bool checkbox = false;

  void _onRememberMeChanged(newValue) => setState(() {
        checkbox = newValue;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ivan Burlakov - Lab 4 Named Parent"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Checkbox(value: checkbox, onChanged: _onRememberMeChanged),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.white,
            ),
            onPressed: () async {
              final result = await Navigator.pushNamed(
                context,
                '/child',
                arguments: checkbox,
              );
              setState(() {
                checkbox = result;
              });
            },
            child: Text('Open child'),
          ),
        ]),
      ),
    );
  }
}

class Child extends StatefulWidget {
  final checkbox;
  Child({Key key = const Key("Child"), this.checkbox}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  bool checkbox = false;

  void _onRememberMeChanged(newValue) => setState(() {
        checkbox = newValue;
      });

  @override
  void initState() {
    super.initState();
    checkbox = widget.checkbox;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ivan Burlakov - Lab 4 Child"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, checkbox),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Checkbox(value: checkbox, onChanged: _onRememberMeChanged),
        ]),
      ),
    );
  }
}
