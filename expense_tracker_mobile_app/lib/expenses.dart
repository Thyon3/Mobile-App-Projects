import 'package:expense_tracker_mobile_app/Models/expense.dart';
import 'package:expense_tracker_mobile_app/Widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_mobile_app/Widgets/expenses_list/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // we will create a list of registered expenses
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "flutter course",
        amount: 99.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Gym",
        amount: 56.7,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Cinema",
        amount: 89.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  // lets implement the method for the add button on the app bar

  void _openAddExpenseOverlay() {
//  we can use some built in functions to show some UI elements when this function is called
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          // builder is a function that we have to pass and the function we are passing is used to return a widget that will be displayed when the add button is clicked
          return NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
          ],
          title: Text('Flutter Expense Tracker'),
        ),
        body: Column(
          children: [
            Text('The Expense chart'),
            Expanded(
              child: ExpensesList(registeredExpenses: _registeredExpenses),
            )
          ],
        ));
  }
}
