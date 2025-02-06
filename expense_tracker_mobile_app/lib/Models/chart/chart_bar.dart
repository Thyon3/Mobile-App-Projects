import 'dart:ffi';
import 'package:expense_tracker_mobile_app/Models/expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;
  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, CategoryOne.food),
      ExpenseBucket.forCategory(expenses, CategoryOne.leisure),
      ExpenseBucket.forCategory(expenses, CategoryOne.travel),
      ExpenseBucket.forCategory(expenses, CategoryOne.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    return maxTotalExpense;
  }
}

Widget build(context) {
  final isDarkmode =
      MediaQuery.of(context).platformBrightness == Brightness.dark;

  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    width: double.infinity,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: LinearGradient(colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.primary.withOpacity(0.0)
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
    ),
    child: Column(
      children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (final bucket in buckets)
              ChartBar (fill: bucket.totalExpenses/maxTotalExpense,)

          ],
        ))
        const SizedBox(height: 12),
        Row(children: buckets.map ((bucket=> Expanded(child: Padding(padding: const EdgeInsets.EdgeInsets.symmetric(horizontal: 4),
        child: Icon(cateoryIcons[bucket.Category],
        color: isDarkmode))))))
      ],
    ),
  );
}
