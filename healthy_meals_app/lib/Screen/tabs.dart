import 'package:flutter/material.dart';
import 'package:healthy_meals_app/Screen/Categories_Screen.dart';
import 'package:healthy_meals_app/Screen/meals_screen.dart';

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

  // a function to change the _selectedPageIndex

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  // TODO: implement widget
  Widget build(context) {
    Widget activeScreen = const CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(meals: []);
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
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
