import 'package:feels_dank_man/utility/logging/logger.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.instance.registerLazySingleton<ILogger>(ConsoleLogger.new);
}

final getIt = GetIt.instance;
