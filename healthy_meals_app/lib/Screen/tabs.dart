import 'package:flutter/material.dart';
import 'package:healthy_meals_app/Screen/Categories_Screen.dart';
import 'package:healthy_meals_app/Screen/filters.dart';
import 'package:healthy_meals_app/Screen/meals_screen.dart';
import 'package:healthy_meals_app/Models/meal.dart';
import 'package:healthy_meals_app/Widgets/mainDrawer.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  // we want a variable to keep track which screen is selected from the tabs
  int _selectedPageIndex = 0;
  // we also want to keep track of the meals that are selected as favourite

  final List<Meal> _favouriteMeals = [];

  // a function to change the _selectedPageIndex

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Filters()));
    }
  }

  // showing info message
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
  // add or remove a favourite meal

  void _toggleMealFavouriteStatus(Meal meal) {
    // we need to check whether a meal is in the favourite meals list or not
    final isExist = _favouriteMeals.contains(meal);
    if (isExist) {
      setState(() {
        _favouriteMeals.remove(meal);
        _showInfoMessage('deleted form favourites');
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showInfoMessage('Marked as favourite');
      });
    }
  }

  @override
  // TODO: implement widget
  Widget build(context) {
    Widget activeScreen = CategoriesScreen(
      OntoggleFavourite: _toggleMealFavouriteStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        drawer: Maindrawer(setScreen: () {
          _setScreen('filters');
        }),
        body: activeScreen,
        bottomNavigationBar: BottomNavigationBar(
          // we have the onTab property whenever the tabs are clicked

          onTap: _selectPage,
          // we will have a function that accepts the index of the tab being clicked
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
          ],
        ));
  }
}
