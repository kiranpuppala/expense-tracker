import 'package:expense_tracker/commons/Styles.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'DepthButton.dart';

Widget filter(BuildContext context) {
  final List<String> entries = <String>['Today', 'This Week', 'This Month'];

  final childList = entries
      .map((e) => Container(
      margin: EdgeInsets.only(left: 26),
      width: 130,
      height: 55,
      child: Center(
          child: DepthButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  e,
                  style: textStyle(context),
                ),
              )))))
      .toList();

  return Container(
      margin: EdgeInsets.only(top: 12),
      height: 90,
      width: double.infinity,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, child: Row(children: childList)));
}
