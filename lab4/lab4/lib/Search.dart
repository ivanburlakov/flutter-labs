import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key = const Key("Search")}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool checkbox = false;

  void _onRememberMeChanged(newValue) => setState(() {
        checkbox = newValue;
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Checkbox(value: checkbox, onChanged: _onRememberMeChanged),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            onPrimary: Colors.white,
          ),
          onPressed: () async {
            final childCheckbox = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Child(checkbox: checkbox)),
            );
            _onRememberMeChanged(childCheckbox);
          },
          child: Text('Open child'),
        ),
      ]),
    );
  }
}

class Child extends StatefulWidget {
  final checkbox;
  Child({Key key = const Key("Child"), @required this.checkbox})
      : super(key: key);

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
        title: Text("Second Route"),
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
