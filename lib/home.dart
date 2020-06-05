import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size ds = Size(0.0, 0.0);
  IconData _toggleBtnIcon = Icons.keyboard_arrow_right;
  Size _smallContainerSize = Size(0.0, 0.0);
  double _containerPos = -1.0;
  bool _isPressed = false;

  // ------------------ USING -----------------------
  Widget _smallContainer(int milliseconds) {
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 20),
      duration: Duration(milliseconds: milliseconds),
      height: _smallContainerSize.height,
      width: _smallContainerSize.width,
      curve: Curves.fastOutSlowIn,
      color: Colors.pink,
    );
  }

  Widget _toggleBtn() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
        if (_isPressed) {
          _toggleBtnIcon = Icons.keyboard_arrow_left;
          _containerPos = 0.0;
          _smallContainerSize = Size(100.0, 100.0);
        } else {
          _toggleBtnIcon = Icons.keyboard_arrow_right;
          _containerPos = -1.0;
          _smallContainerSize = Size(0.0, 0.0);
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: 30,
        height: 60,
        color: Colors.pink,
        child: Icon(_toggleBtnIcon, color: Color(0xff0f0247), size: 30),
      ),
    );
  }

  Widget _mainContainer() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      transform: Matrix4.translationValues(_containerPos * ds.width, 0.0, 0.0),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      width: 140,
      decoration: BoxDecoration(
        color: Color(0xff0f0247),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(  
            color: Colors.pinkAccent,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _smallContainer(700),
          _smallContainer(900),
          _smallContainer(1100),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 50, 50, 1),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _toggleBtn(),
            _mainContainer(),
          ],
        ),
      ),
    );
  }
}
