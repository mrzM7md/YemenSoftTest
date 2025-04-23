import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class SetupServiceLocator {
  void init() {
    // sl.registerLazySingleton(() => ControlPanelLogic());
    // sl.registerLazySingleton(() => ControlPanelMethods(
    //   baseControlPanelLogic: sl<ControlPanelLogic>()
    // ));
  }
}
