import 'package:expense_tracker/commons/Styles.dart';
import 'package:expense_tracker/resources/values/appColors.dart';
import 'package:expense_tracker/screens/AllExpenses.dart';
import 'package:expense_tracker/storage/moor/table/Expenses.dart';
import 'package:expense_tracker/widgets/NeumorhicTextField.dart';
import 'package:expense_tracker/widgets/NeumorphicDropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddExpense extends StatefulWidget {
  AddExpense({Key key}) : super(key: key);

  @override
  AddExpenseState createState() => AddExpenseState();
}

class AddExpenseState extends State<AddExpense> {
  String name;
  String amount;
  String category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: NeumorphicTheme.baseColor(context),
            body: Container(
                height: double.infinity,
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    appBar(context),
                    content(context),
                    Visibility(
                      visible: false,
                      child: Expanded(
                          child: Container(
                        height: 700,
                        width: double.infinity,
                        child: StreamBuilder(
                          stream:
                              ExpenseDataBase().expensesDao.watchAllExpenses,
                          builder:
                              (context, AsyncSnapshot<List<Expense>> snapshot) {
                            if (snapshot.hasError) {
                              return Text("No data");
                            }
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemBuilder: (_, index) {
                                  return Card(
                                    color: Colors.orangeAccent,
                                    child: ListTile(
                                        leading: CircleAvatar(
                                          child: Text('${index + 1}'),
                                          radius: 20,
                                        ),
                                        title: Text(snapshot.data[index].name),
                                        subtitle: Text(
                                            "Rs. ${snapshot.data[index].amount}"),
                                        trailing: IconButton(
                                          icon: Icon(Icons.delete_outline),
                                          onPressed: () {
                                            setState(() {
                                              ExpenseDataBase()
                                                  .expensesDao
                                                  .deleteExpense(
                                                      snapshot.data[index]);
                                            });
                                          },
                                          color: Colors.red,
                                        )),
                                  );
                                },
                                itemCount: snapshot.data.length,
                              );
                            }
                            return Text("some");
                          },
                        ),
                      )),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    footer(context)
                  ],
                ))));
  }

  Widget footer(BuildContext context) {
    return Container(
        width: double.infinity,
        child: NeumorphicButton(
            onPressed: () {
              if (name != null && amount != null && category != null) {
                ExpenseDataBase().expensesDao.insertExpense(Expense(
                    name: name,
                    amount: amount,
                    category: category,
                    date: DateTime.now().millisecondsSinceEpoch));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllExpenses()));
              }
            },
            style: neumorphicStyle(context),
            padding: EdgeInsets.only(left: 24, bottom: 19, top: 19, right: 24),
            child: Center(
                child: Text(
              "Add Expense",
              style: hintStyle(context),
            ))));
  }

  Widget content(BuildContext context) {
    const space = SizedBox(height: 30);
    return Container(
        margin: EdgeInsets.only(top: 44),
        child: Column(children: [
          neumorphicTextField(context, "Name", (value) {
            setState(() {
              name = value;
            });
          }),
          space,
          neumorphicTextField(context, "Amount", (value) {
            setState(() {
              amount = value;
            });
          }),
          space,
          NeumorphicDropdown(
            label: "Category",
            entries: [
              "Food",
              "Shopping",
              "Entertainment",
              "Transport",
              "Health",
              "Luxury"
            ],
            onSelected: (value) {
              setState(() {
                category = value;
              });
            },
          ),
          space,
          //TODO Date Selection is reserved for V2
          Visibility(
            visible: false,
            child: NeumorphicButton(
                onPressed: () {},
                style: neumorphicStyle(context),
                padding:
                    EdgeInsets.only(left: 24, bottom: 19, top: 19, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Date",
                      style: hintStyle(context),
                    ),
                    Icon(Icons.date_range,
                        size: 24, color: AppColors.PRIMARY_COLOR),
                  ],
                )),
          )
        ]));
  }

  Widget appBar(BuildContext context) {
    return Container(
      child: Row(
        children: [
          NeumorphicButton(
            onPressed: () {},
            style: neumorphicStyle(context),
            padding: EdgeInsets.all(8),
            child: Icon(Icons.keyboard_backspace,
                size: 24, color: AppColors.PRIMARY_COLOR),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "New Expense",
              style: appBarTitleTextStyle(context),
            ),
          )
        ],
      ),
    );
  }
}
