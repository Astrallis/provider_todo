import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_todo/provider/task_provider.dart';
import '../locator.dart';

List<SingleChildWidget> supplyProviders() {
  return [
    ChangeNotifierProvider(
      create: (context) => locator<TaskProvider>(),
    )
  ];
}
