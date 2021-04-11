import 'package:flutter/material.dart';

class More extends StatefulWidget {
  More({Key key = const Key("More")}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return StatelessContainer();
  }
}

class StatelessContainer extends StatelessWidget {
  StatelessContainer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text('This is a stateless Container')),
                Expanded(
                  child: StatefulContainer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatefulContainer extends StatefulWidget {
  const StatefulContainer({Key key = const Key('StatefulContainer')})
      : super(key: key);

  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  bool checkBox = false;
  void onChange(newValue) => setState(() {
        checkBox = newValue;
      });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        color: Colors.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text('This is a stateful Container')),
            Expanded(
              child: Container(
                color: Colors.yellow,
                child: Column(
                  children: [
                    Text('This is a stateless Container'),
                    StatelessChild(checkBox, onChange),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.purple,
                child: Column(
                  children: [
                    Text('This is a stateless Container'),
                    StatelessChild(checkBox, onChange),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatelessChild extends StatelessWidget {
  final checkbox;
  final onChange;
  StatelessChild(this.checkbox, this.onChange);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkbox,
      onChanged: (newValue) {
        onChange(newValue);
      },
    );
  }
}
