import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:healthy_meals_app/Providers/filters_provider.dart';

class Filters extends ConsumerStatefulWidget {
  Filters({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;
  @override
  ConsumerState<Filters> createState() {
    // TODO: implement createState
    return _FiltersState();
  }
}

class _FiltersState extends ConsumerState<Filters> {
  var _gluttenFreeSet = false;
  var _lactoseFreeSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    final activeFilter = ref.watch();
    _gluttenFreeSet = activeFilter[Filter.glutenFree] ?? false;
    _lactoseFreeSet = activeFilter[Filter.lactoseFree] ?? false;
    _vegetarianFilterSet = activeFilter[Filter.vegetarian] ?? false;
    _veganFilterSet = activeFilter[Filter.vegan] ?? false;
    super.initState();
  }

  @override
  // TODO: implement widget
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filteres'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _gluttenFreeSet,
            Filter.lactoseFree: _lactoseFreeSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
          });
          return true;
        },
        child: Column(
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
      ),
    );
  }
}
