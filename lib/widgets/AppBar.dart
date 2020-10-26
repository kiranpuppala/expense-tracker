import 'package:expense_tracker/commons/Styles.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Widget appBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 24, right: 24),
    child: Row(
      children: [
        Expanded(
          child: Text("Expense Tracker", style: appBarTitleTextStyle(context)),
        ),
        NeumorphicButton(
          onPressed: () {},
          style: neumorphicStyle(context),
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            Icons.settings,
            size: 20,
            color: NeumorphicTheme.defaultTextColor(context),
          ),
        )
      ],
    ),
  );
}
