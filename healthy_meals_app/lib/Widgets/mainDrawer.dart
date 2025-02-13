import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  Maindrawer({super.key, required this.setScreen});

  final void Function() setScreen;

  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withBlue(89),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 49,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Ready to Eat...',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            onTap: setScreen,
          ),
          ListTile(
            leading: Icon(
              Icons.boy,
              size: 26,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            title: Text(
              'Meet Thyon...',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
