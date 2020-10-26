import 'package:expense_tracker/commons/Styles.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Widget neumorphicTextField(
    BuildContext context, String hint, ValueChanged<String> onChanged,
    {margin = const EdgeInsets.all(0)}) {
  return Neumorphic(
      margin: margin,
      style: depthStyle(context),
      child: TextField(
        onChanged: onChanged,
        decoration: new InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: hintStyle(context),
            contentPadding:
                EdgeInsets.only(left: 24, bottom: 19, top: 19, right: 24),
            hintText: hint),
      ));
}
