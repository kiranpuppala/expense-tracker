import 'package:moor_flutter/moor_flutter.dart';

part 'Expenses.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 3, max: 32)();

  TextColumn get amount => text().withLength(min: 1, max: 32)();

  TextColumn get category => text().withLength(min: 1, max: 32)();

  TextColumn get date => text().withLength(min: 1, max: 64)();

  @override
  Set<Column> get primaryKey => {id};
}

// this annotation tells moor to prepare a database class that uses the tables we just defined. (Modes in our case)
@UseMoor(tables: [Expenses], daos: [ExpensesDao])
class ExpenseDataBase extends _$ExpenseDataBase {
  ExpenseDataBase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
        ));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Expenses])
class ExpensesDao extends DatabaseAccessor<ExpenseDataBase>
    with _$ExpensesDaoMixin {
  ExpensesDao(ExpenseDataBase db) : super(db);

  Future<List<Expense>> get allExpenses => select(expenses).get();

  Stream<List<Expense>> get watchAllExpenses => select(expenses).watch();

  Future insertExpense(Expense expense) => into(expenses).insert(expense);

  Future deleteExpense(Expense expense) => delete(expenses).delete(expense);
}
