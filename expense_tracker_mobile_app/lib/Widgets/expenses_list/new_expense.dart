import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/number_symbols_data.dart';

class NewExpense extends StatefulWidget {
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
/*// we will add a variable which is the user's input and can be nothing intially
  var _enteredTitle = '';
  // a function to save the user input on title of the expense
  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }*/

  // we can use the manually saving the text input method or we can let flutter do the work by the likt the following
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // we have to ovrride the dispose method here
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // a function ot show the calender or the date picker for selecting the date
  void presentDatePicker() {
    final now = DateTime.now();
    final fistDate = DateTime(now.year - 1, now.month, now.day);
    // we can usea built in funciton to show a date picker for selecting a date
    showDatePicker(
        context: context, initialDate: now, firstDate: fistDate, lastDate: now);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // textfield to enter the title of the expense
          TextField(
            // we will add another method to save the changes of the text field or simply to store the user input
            // onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            // we can put the label or the text before the text field using the decoartion
            decoration: InputDecoration(label: Text('title')),
          ),
          // text field to add the amount of the expense

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                      label: Text('Amount: '), prefixText: '\$ '),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('selected date'),
                  IconButton(
                      onPressed: presentDatePicker,
                      icon: Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),

          // canceling and submmitting buttons

          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              Spacer(),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
