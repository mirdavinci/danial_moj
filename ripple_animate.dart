import 'package:flutter/material.dart';


class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}


class _SamplePageState extends State<SamplePage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    var controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();

    return Scaffold(
      appBar: AppBar(title: Text("Title")),
      body: AnimatedBuilder(
        animation:
            CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildContainer(150 * controller.value),
              _buildContainer(200 * controller.value),
              _buildContainer(250 * controller.value),
              _buildContainer(300 * controller.value),
              _buildContainer(350 * controller.value),
              Align(
                  child: Icon(
                Icons.done,
                size: 44,
              )),
            ],
          );
        },
      ),
    );
  }


  Widget _buildContainer(double radius) {

    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.lightGreen.withOpacity(0.75 - 0.5)  ,
      ),
    );
  }
}
