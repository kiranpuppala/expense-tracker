import 'package:expense_tracker/commons/Styles.dart';
import 'package:expense_tracker/resources/values/appColors.dart';
import 'package:expense_tracker/storage/moor/table/Expenses.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AllExpenses extends StatefulWidget {
  AllExpenses({Key key}) : super(key: key);

  @override
  AllExpensesState createState() => AllExpensesState();
}

class AllExpensesState extends State<AllExpenses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: NeumorphicTheme.baseColor(context),
            body: Container(
                height: double.infinity,
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [appBar(context), expensesList(context)],
                ))));
  }
}

Widget expenseItem(BuildContext context, Expense expense) {
  return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      width: double.infinity,
      child: Column(children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(expense.name, style: primaryActive(context)),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                        DateTime.fromMillisecondsSinceEpoch(expense.date)
                            .toString(),
                        style: secondaryInactive(context)),
                  )
                ],
              ),
              Text("₹${expense.amount}", style: secondaryActive(context))
            ]),
      ]));
}

Widget expensesList(BuildContext context) {
  return Neumorphic(
      style: neumorphicStyle(context),
      margin: const EdgeInsets.only(top: 40.0),
      padding: EdgeInsets.only(left: 28, right: 28, top: 16, bottom: 16),
      child: StreamBuilder(
          stream: ExpenseDataBase().expensesDao.watchAllExpenses,
          builder: (context, AsyncSnapshot<List<Expense>> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return expenseItem(context, snapshot.data[index]);
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                    color: NeumorphicTheme.defaultTextColor(context)
                        .withOpacity(0.26)),
              );
            } else {
              return Text("Fetching");
            }
          }));
}

Widget appBar(BuildContext context) {
  return Container(
    child: Row(
      children: [
        NeumorphicButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: neumorphicStyle(context),
          padding: EdgeInsets.all(8),
          child: Icon(Icons.keyboard_backspace,
              size: 24, color: AppColors.PRIMARY_COLOR),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            "Expenses",
            style: appBarTitleTextStyle(context),
          ),
        )
      ],
    ),
  );
}
