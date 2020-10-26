// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Expenses.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final String name;
  final String amount;
  final String category;
  final String date;
  Expense(
      {@required this.id,
      @required this.name,
      @required this.amount,
      @required this.category,
      @required this.date});
  factory Expense.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Expense(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      amount:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<String>(json['amount']),
      category: serializer.fromJson<String>(json['category']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<String>(amount),
      'category': serializer.toJson<String>(category),
      'date': serializer.toJson<String>(date),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Expense>>(bool nullToAbsent) {
    return ExpensesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    ) as T;
  }

  Expense copyWith(
          {int id, String name, String amount, String category, String date}) =>
      Expense(
        id: id ?? this.id,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        category: category ?? this.category,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(amount.hashCode, $mrjc(category.hashCode, date.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == id &&
          other.name == name &&
          other.amount == amount &&
          other.category == category &&
          other.date == date);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> amount;
  final Value<String> category;
  final Value<String> date;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
  });
  ExpensesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> amount,
      Value<String> category,
      Value<String> date}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
    );
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExpensesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 3, maxTextLength: 32);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedTextColumn _amount;
  @override
  GeneratedTextColumn get amount => _amount ??= _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn('amount', $tableName, false,
        minTextLength: 1, maxTextLength: 32);
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn('category', $tableName, false,
        minTextLength: 1, maxTextLength: 32);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn('date', $tableName, false,
        minTextLength: 1, maxTextLength: 64);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, amount, category, date];
  @override
  $ExpensesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'expenses';
  @override
  final String actualTableName = 'expenses';
  @override
  VerificationContext validateIntegrity(ExpensesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.amount.present) {
      context.handle(
          _amountMeta, amount.isAcceptableValue(d.amount.value, _amountMeta));
    } else if (amount.isRequired && isInserting) {
      context.missing(_amountMeta);
    }
    if (d.category.present) {
      context.handle(_categoryMeta,
          category.isAcceptableValue(d.category.value, _categoryMeta));
    } else if (category.isRequired && isInserting) {
      context.missing(_categoryMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Expense.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ExpensesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.amount.present) {
      map['amount'] = Variable<String, StringType>(d.amount.value);
    }
    if (d.category.present) {
      map['category'] = Variable<String, StringType>(d.category.value);
    }
    if (d.date.present) {
      map['date'] = Variable<String, StringType>(d.date.value);
    }
    return map;
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(_db, alias);
  }
}

abstract class _$ExpenseDataBase extends GeneratedDatabase {
  _$ExpenseDataBase(QueryExecutor e)
      : super(const SqlTypeSystem.withDefaults(), e);
  $ExpensesTable _expenses;
  $ExpensesTable get expenses => _expenses ??= $ExpensesTable(this);
  ExpensesDao _expensesDao;
  ExpensesDao get expensesDao =>
      _expensesDao ??= ExpensesDao(this as ExpenseDataBase);
  @override
  List<TableInfo> get allTables => [expenses];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ExpensesDaoMixin on DatabaseAccessor<ExpenseDataBase> {
  $ExpensesTable get expenses => db.expenses;
}
