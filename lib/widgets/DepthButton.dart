import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DepthButton extends StatefulWidget {
  DepthButton({Key key, this.child, @required this.onPressed})
      : super(key: key);

  final GestureTapCallback onPressed;
  final Widget child;

  @override
  _DepthButtonState createState() => _DepthButtonState();
}

class _DepthButtonState extends State<DepthButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        style: (_isPressed ? _depthStyle(context) : _neumorphicStyle(context)),
        padding: const EdgeInsets.all(18.0),
        child: widget.child);
  }
}

NeumorphicStyle _depthStyle(BuildContext context) {
  return NeumorphicStyle(
    depth: -7,
    intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
  );
}

NeumorphicStyle _neumorphicStyle(BuildContext context) {
  return NeumorphicStyle(
    depth: NeumorphicTheme.depth(context),
    intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
  );
}
