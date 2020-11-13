import 'package:flutter_neumorphic/flutter_neumorphic.dart';

NeumorphicStyle neumorphicStyle(BuildContext context) {
  return NeumorphicStyle(
    depth: NeumorphicTheme.depth(context),
    intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
  );
}

NeumorphicStyle depthStyle(BuildContext context) {
  return NeumorphicStyle(
    depth: -7,
    intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
  );
}

TextStyle hintStyle(BuildContext context) {
  return TextStyle(
      fontSize: 14,
      color: NeumorphicTheme.defaultTextColor(context),
      fontFamily: "Lato",
      fontWeight: FontWeight.w700);
}

TextStyle appBarTitleTextStyle(BuildContext context) {
  return TextStyle(
      fontSize: 18,
      color: NeumorphicTheme.defaultTextColor(context),
      fontFamily: "Lato",
      fontWeight: FontWeight.w700);
}

TextStyle textStyle(BuildContext context) {
  return TextStyle(
      fontSize: 12,
      color: NeumorphicTheme.defaultTextColor(context),
      fontFamily: "Lato",
      fontWeight: FontWeight.w700);
}

TextStyle primaryActive(BuildContext context) {
  return TextStyle(
      fontSize: 14,
      color: NeumorphicTheme.defaultTextColor(context),
      fontFamily: "Lato",
      fontWeight: FontWeight.w700);
}

TextStyle secondaryActive(BuildContext context) {
  return TextStyle(
      fontSize: 12,
      color: NeumorphicTheme.defaultTextColor(context),
      fontFamily: "Lato",
      fontWeight: FontWeight.w700);
}

TextStyle secondaryInactive(BuildContext context) {
  return TextStyle(
      fontSize: 12,
      color:  NeumorphicTheme.defaultTextColor(context).withOpacity(0.75),
      fontFamily: "Lato",
      fontWeight: FontWeight.w700);
}