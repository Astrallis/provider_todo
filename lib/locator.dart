import 'package:get_it/get_it.dart';
import 'package:provider_todo/provider/task_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator () {
  locator.registerLazySingleton(() => TaskProvider());
}
