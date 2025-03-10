import 'package:expense_tracker_mobile_app/main.dart';
import 'package:expense_tracker_mobile_app/models/place.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  PlacesList({required this.placesList, super.key});

  List<Place> placesList;

  Widget build(context) {
    Widget mainContent = (ListView.builder(
        itemCount: placesList.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(
                placesList[index].title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: colorScheme.onSecondaryContainer),
              ),
              leading: Container(
                width: 16,
                height: 16,
                color: colorScheme.onPrimaryContainer,
              ),
              subtitle: Text(
                'anske mengesha is one of the most well know ICT traders in the whole world long live to him ',
                style: ThemeData()
                    .textTheme
                    .bodySmall!
                    .copyWith(color: colorScheme.primaryContainer),
              ),
            )));
    if (placesList.isEmpty) {
      mainContent = Center(
          child: Text(
        'please add some places and come back later',
        style: ThemeData().textTheme.bodyMedium!.copyWith(
              color: colorScheme.primaryContainer,
            ),
      ));
    }
    return mainContent;
  }
}
