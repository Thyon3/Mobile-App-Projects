import 'package:flutter/material.dart';
import 'package:healthy_meals_app/Models/category.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(context) {
    // we can make any widget tappable by wrapping that widget with InkWell
    return InkWell(
      onTap: onSelectCategory,
      // to get a color change when we tab the widget
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // making the background of the category element to category.color with different opacity
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                //only want to define the color of the text
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
