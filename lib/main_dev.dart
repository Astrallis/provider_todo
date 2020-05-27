import 'package:provider_todo/locator.dart';
import 'env/app_env.dart';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  setupLocator();
  AppEnvironment.setupEnvironment(Environment.dev);
  runApp(MyApp());
}
