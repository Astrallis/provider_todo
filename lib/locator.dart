import 'package:get_it/get_it.dart';
import 'package:provider_todo/provider/task_provider.dart';
import 'package:provider_todo/services/task_service.dart';

GetIt locator = GetIt.instance;

void setupLocator () {
  locator.registerLazySingleton(() => TaskProvider());
  locator.registerLazySingleton(() => TaskService());
}
