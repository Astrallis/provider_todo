import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/provider/supply_provider.dart';
import 'package:provider_todo/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: supplyProviders(),
        child: MaterialApp(
        theme: ThemeData(unselectedWidgetColor: Colors.white),
        title: "Flutter Todo",
        initialRoute: "/",
        routes: appRoutes
      ),
    );
  }
}
