import 'package:expense_tracker/commons/Styles.dart';
// import 'package:expense_tracker/storage/moor/table/Expenses.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Widget showExpensesButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 24, right: 24),
    margin: EdgeInsets.only(top: 52),
    width: double.infinity,
    child: NeumorphicButton(
        margin: EdgeInsets.only(top: 12),
        onPressed: () {
          // MyDatabase().expensesDao.insertNewOrder(Expense(
          //   userName: "kiran",
          //   watchMode: "children"
          // ));
        },
        style: neumorphicStyle(context),
        padding: const EdgeInsets.all(18.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Show my Expenses",
            style: textStyle(context),
          ),
        )),
  );
}
