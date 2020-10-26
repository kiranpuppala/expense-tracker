import 'package:expense_tracker/storage/moor/table/Expenses.dart';
import 'package:expense_tracker/widgets/AppBar.dart';
import 'package:expense_tracker/widgets/BottomMenu.dart';
import 'package:expense_tracker/widgets/Filter.dart';
import 'package:expense_tracker/widgets/ShowExpensesButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:expense_tracker/widgets/pie/NeumorphicPie.dart';
import 'package:expense_tracker/commons/Styles.dart';
import 'package:expense_tracker/screens/AddExpense.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFE0E5EC),
        lightSource: LightSource.topLeft,
        defaultTextColor: Color(0xFF627A9D),
        depth: 7,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 7,
      ),
      home: AddExpense(),
    );
  }
}
//
// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key key}) : super(key: key);
//
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: NeumorphicTheme.baseColor(context),
//             body: Container(
//                 height: double.infinity,
//                 padding: EdgeInsets.only(top: 24, bottom: 24),
//                 child: Column(
//                   children: [
//                     appBar(context),
//                     filter(context),
//                     Text(
//                       "",
//                       style: textStyle(context),
//                     ),
//                     Expanded(child: NeumorphicPie(),),
//                     showExpensesButton(context),
//                     bottomMenu(context)
//                   ],
//                 ))));
//   }
// }
