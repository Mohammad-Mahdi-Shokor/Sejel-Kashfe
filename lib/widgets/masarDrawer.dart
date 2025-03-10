import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Providers/UserDataProvider.dart';
import '../data/fe2aat_Male.dart';
import 'matalebPage.dart';

class Masardrawer extends ConsumerWidget {
  const Masardrawer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Fe2a user = ref.read(fe2aProvider);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8)
                ])),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        size: 48,
                        Icons.map,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        masaratName[user]!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                )),
            for (int i = 0; i < masarat.length; i++)
              masarListTile(context, masarat[i], i, user),
          ],
        ),
      ),
    );
  }

  ListTile masarListTile(BuildContext context, String name, int i, Fe2a user) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (ctx) => Matalebpage(
                      numberOfMajal: i,
                    )));
      },
      leading: CircleAvatar(
        radius: 14,
        child: Text("${i + 1}",
            style: TextStyle(
              color: fe2aColor[user]![1],
            )),
      ),
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
