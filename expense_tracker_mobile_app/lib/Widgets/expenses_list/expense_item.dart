import 'package:expense_tracker_mobile_app/Models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  // add the expense item to be displayed on the screen
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // we will use the Card widget for styling purposes

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, // we are accessing the theme of the title large we have given in the material app
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer() /* takes all the remaining space which is available between the widgets it is in */,
                Row(
                  children: [
                    Icon(cateoryIcons[expense.CategoryTwo]),
                    SizedBox(
                      width: 8,
                    ),
                    Text(expense.fomattedDate)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
