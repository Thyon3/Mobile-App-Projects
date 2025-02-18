import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:healthy_meals_app/Screen/Categories_Screen.dart';
import 'package:healthy_meals_app/Screen/filters.dart';
import 'package:healthy_meals_app/Screen/meals_screen.dart';
import 'package:healthy_meals_app/Models/meal.dart';
import 'package:healthy_meals_app/Widgets/mainDrawer.dart';
import 'package:healthy_meals_app/Providers/favourites_provider.dart';
import 'package:healthy_meals_app/Providers/filters_provider.dart';

const kIntialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  // we want a variable to keep track which screen is selected from the tabs
  int _selectedPageIndex = 0;
  // we also want to keep track of the meals that are selected as favourite

  final List<Meal> _favouriteMeals = [];
  // a variable to store the selected filters
  Map<Filter, bool> _selectedFilters = kIntialFilters;

  // a function to change the _selectedPageIndex
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (context) => Filters(
                currentFilters: _selectedFilters,
              )));
    }
  }

  @override
  // TODO: implement widget
  Widget build(context) {
    final availableMeals = ref.watch(fitleredMealsProvider);
    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activeScreen = MealsScreen(
        meals: favouriteMeals,
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
