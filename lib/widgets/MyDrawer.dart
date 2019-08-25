//
// MyDrawer.dart
// flutter_demo
//
// Created by c344081 on 2019/8/24.
// Copyright © 2019 c344081. All rights reserved.
//

import 'package:flutter/material.dart';
import '../i10n/_localization.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showPageNamed(String routeName) {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(routeName);
    }
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/default-avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "c344081",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(GmLocalizations.of(context).language),
                    onTap: () {
                      showPageNamed("language");
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(GmLocalizations.of(context).theme),
                    onTap: () {
                      showPageNamed("themes");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
