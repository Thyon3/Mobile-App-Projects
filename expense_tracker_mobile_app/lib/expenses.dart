import 'dart:ui';

import 'package:expense_tracker_mobile_app/Models/chart/chart.dart';
import 'package:expense_tracker_mobile_app/Models/chart/chart_bar.dart';
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
        CategoryTwo: CategoryOne.work),
    Expense(
        title: "Gym",
        amount: 56.7,
        date: DateTime.now(),
        CategoryTwo: CategoryOne.leisure),
    Expense(
        title: "Cinema",
        amount: 89.99,
        date: DateTime.now(),
        CategoryTwo: CategoryOne.leisure),
  ];

  // lets implement the method for the add button on the app bar

  void _openAddExpenseOverlay() {
//  we can use some built in functions to show some UI elements when this function is called
    showModalBottomSheet(
        // we can make this screen layout out of the devices contents like the camera
        useSafeArea: true,
        isScrollControlled:
            true, //will make the showModalBottomSheet contain the full screen
        context: context,
        builder: (ctx) {
          // builder is a function that we have to pass and the function we are passing is used to return a widget that will be displayed when the add button is clicked
          return NewExpense(onAddExpense: _addExpense);
        });
  }

//a function to add expenses

  void _addExpense(Expense expense) {
    // add a new expense to the _registeredExpenses list in the setState cause we want to show the added expense as soon as it is added
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

// remove expense function whcih is used ti remove an expense when we swipe them to the left
  void _removeExpenses(Expense expense) {
    // befor removing the expense we have to get the index of it incase the user want to undo the delete
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(
          expense); //remove the expense not only visually from the screen but also from the internal list also
    });
    // how to show the undo message
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense Deleted'),
      action: SnackBarAction(
          label: "መቀልበስ",
          onPressed: () {
            // if undo return the expense item back to where it was to its correct index using the insert method
            _registeredExpenses.insert(expenseIndex, expense);
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // to have a responsive layout for portrait and landscape modes we first want to know the width of the screen available
    final width = MediaQuery.of(context)
        .size
        .width; //flutter rebuild the build method when we rotate the screen

    // if there are no any expenses available we want to show the user a text to add ne expenses and try again

    Widget mainContent = Center(
      child: Text('No Expenses Found Start Adding  some'),
    );

    // check whether there are Expenses or not
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          registeredExpenses: _registeredExpenses, onSwiped: _removeExpenses);
    }
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
          ],
          title: Text('Flutter Expense Tracker'),
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(
                      expenses:
                          _registeredExpenses), // chart view of the expenses
                  Expanded(
                    child: mainContent, // the expenses list
                  )
                ],
              )
            : Row(
                children: [
                  // since both chart and row use width = double.infinity there is an error so to solve that we can wrap chart in expanded
                  Expanded(
                    child: Chart(expenses: _registeredExpenses),
                  ), // chart view of the expenses
                  Expanded(
                    child: mainContent, // the expenses list
                  )
                ],
              ));
  }
}
