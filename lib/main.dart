import 'package:animtions/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    animation = new Tween(begin: 0.0, end: 400.0).animate(controller);
    animation.addListener(() {
      setState(() {
        // the state of the animation has changed
      });
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstString.APP_TITLE),
      ),
      body: Container(
        height: animation.value,
        width: animation.value,
        child: Center(
          child: FlutterLogo(
            size: 300.0,
          ),
        ),
      ),
    );
  }
}
