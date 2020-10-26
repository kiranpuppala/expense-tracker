import 'package:expense_tracker/commons/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Widget bottomMenu(BuildContext context) {
  return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      margin: EdgeInsets.only(top: 52),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 60,
            child: NeumorphicButton(
              onPressed: () {},
              style: neumorphicStyle(context),
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.home,
                size: 35,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 26),
            width: 60,
            child: NeumorphicButton(
              onPressed: () {},
              style: neumorphicStyle(context),
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.timeline,
                size: 35,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 26),
              width: 60,
              child: NeumorphicButton(
                onPressed: () {},
                style: neumorphicStyle(context),
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.add,
                  size: 35,
                  color: NeumorphicTheme.defaultTextColor(context),
                ),
              ),
            ),
          )
        ],
      ));
}
