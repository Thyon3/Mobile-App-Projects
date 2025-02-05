import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_mobile_app/Models/expense.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
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
  DateTime? _selectedDate;
  CategoryOne _selectedCategory =
      CategoryOne.leisure; //intillay set the _selectedCategory to leisure
  var formatter =
      DateFormat.yMd(); // we have to ovrride the dispose method here

  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // a function ot show the calender or the date picker for selecting the date
  void presentDatePicker() async {
    final now = DateTime.now();
    final fistDate = DateTime(now.year - 1, now.month, now.day);
    // we can usea built in funciton to show a date picker for selecting a date
    final pickedDate = await showDatePicker(
        context: context, initialDate: now, firstDate: fistDate, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //deifining the submit function for user input validation
  void _submitExpenseData() {
    //check whether the user inputs a not null value or not
    final enteredAmount = double.tryParse(_amountController
        .text); //tryParse(hellp)=> null  tryParse(11.2) => 11.2

    final isEnteredAmountValid = enteredAmount == null ||
        enteredAmount <= 0; // amount should be a positive integer

    if (_titleController.text.trim().isEmpty ||
        isEnteredAmountValid ||
        _selectedDate == null) {
      // use the built in showDialogue widget
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Invalid Input'),
                content: Text(
                    'Please make sure a valid title, amount, date and category was entered. Ena demo mnshe new kes bel enji Nigga'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Eshi Man'))
                ],
              ));
      return;
    }
    // we have to use the widget property to accesst the methods or variables that are defined in the NewExpense class since we are in _StateNewExpense class
    // call the addExpense function on submission

    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        CategoryTwo: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
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
                  Text(_selectedDate != null
                      ? formatter.format(_selectedDate!)
                      : 'No Date Chosen'),
                  IconButton(
                      onPressed: presentDatePicker,
                      icon: Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          SizedBox(
            height: 16,
          ),

          // canceling and submmitting buttons

          Row(
            children: [
              // drop down button for the CategoryOne selection
              DropdownButton(
                  // since we are saving the recent selectedCategory we can show it
                  value: _selectedCategory,
                  items: CategoryOne.values
                      .map((CategoryOne) => DropdownMenuItem(
                          value: CategoryOne,
                          child: Text(CategoryOne.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    // now value should never  be null if we want to assign it to _selectedCategory
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
