import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  Filters({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FiltersState();
  }
}

class _FiltersState extends State<Filters> {
  var _gluttenFreeSet = false;
  var _lactoseFreeSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;
  @override
  // TODO: implement widget
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filteres'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _gluttenFreeSet,
            onChanged: (isChecked) {
              setState(() {
                _gluttenFreeSet = isChecked;
              });
            },
            title: Text(
              'Glutten Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            subtitle: Text(
              'Only include Glutter free meals',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactoseFreeSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeSet = isChecked;
              });
            },
            title: Text(
              'lactose Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            subtitle: Text(
              'Only include Lactose free meals',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vegetarianFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegetarian Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            subtitle: Text(
              'Only include vegerarian  meals',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegan Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals ',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
