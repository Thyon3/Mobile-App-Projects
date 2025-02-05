import 'package:expense_tracker_mobile_app/Models/expense.dart';
import 'package:expense_tracker_mobile_app/Widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {super.key, required this.registeredExpenses, required this.onSwiped});

  final List<Expense> registeredExpenses;
  final void Function(Expense expense) onSwiped;
  @override
  Widget build(context) {
    // we want to print the expenses list in column form but since the we don't know the amount of list or the length of the list  that we are going to have we should use the listView widget

    return ListView.builder(
      itemCount: registeredExpenses.length,
      /* tells the length of the list elements we want to have */
      itemBuilder: (ctx, index /*index of the list elements */) {
        // returns a widget
        // this function is called the number of times equal to itemCount if itemCount is 2 hten the function will be called twice
        return Dismissible(
            key: ValueKey(registeredExpenses[index]),
            onDismissed: (direction) {
              onSwiped(registeredExpenses[index]);
            },
            child: Column(
              children: [ExpenseItem(registeredExpenses[index])],
            ));
      },
    );
  }
}
