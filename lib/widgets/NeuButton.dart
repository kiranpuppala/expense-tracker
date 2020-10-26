import 'package:flutter/material.dart';

class NeuButton extends StatefulWidget {
  NeuButton({Key key}) : super(key: key);

  @override
  _NeuButtonState createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  bool _enabled = false;

  void _handleTap(enable) {
    setState(() {
      _enabled = enable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (TapDownDetails details) {
          _handleTap(true);
        },
        onTapUp: (TapUpDetails details) {
          _handleTap(false);
        },
        child: AnimatedContainer(
          height: 55,
          width: 312,
          alignment: Alignment(0.0, 0.0),
          decoration: BoxDecoration(
            color: _enabled ? Color(0xFFE0E5EC) : Color(0xFFFF0000),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(17)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFA3B1C6),
                  offset: Offset(6, 6),
                  blurRadius: 16),
              BoxShadow(
                  color: Color(0xFFFFFFFF),
                  offset: Offset(-6, -6),
                  blurRadius: 16)
            ],
          ),
          duration: Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          child: Text(
            _enabled ? "enabled" : "disabled",
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFF627A9D),
                fontFamily: "Lato",
                fontWeight: FontWeight.w700),
          ),
        ));
  }
}
