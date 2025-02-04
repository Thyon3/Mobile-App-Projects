import 'package:expense_tracker_mobile_app/expenses.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// the uuid package gives us the class Uuid to create an object like this
final uuid = Uuid();
// create an object called formatter using the class Dateformat
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }
// lets have a specifc icon for each category for that we will use Map

const cateoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    // these are named arguments for the
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : /* we can intialize every variable we want which 
  is found in class using this  giving id a unique id every time an expense is created*/
        id = uuid
            .v4(); // we are intializing the class members as we created the objects of the class that is why they are required

  final String title; //we want to have a title for our expenses
  final double amount; // and also hte amount for the expenses
  final String
      id; // a unique id for each expense we have which is needed to delete or update an expense
  final DateTime date;
  //a built in type Date tiem used ot add a date variable for hte expanses
  final Category category;

  // define a getter method to return the formatteddate

  String get fomattedDate {
    return formatter.format(date);
    // we will use ht third party package called intil for fomatting a date
  }
}


// to have a unique id for each expense we can use a third party package 
// which can help us to produce a unique id for each expense which is called the uuid pakcage 
// we can install it using the command: flutter pub add uuid 
