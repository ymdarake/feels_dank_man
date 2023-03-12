import 'package:feels_dank_man/api/seventv/seventv_api_client.dart';
import 'package:feels_dank_man/core/http_client.dart';
import 'package:feels_dank_man/utility/logging/logger.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.instance.registerLazySingleton<ILogger>(ConsoleLogger.new);
  GetIt.instance.registerLazySingleton<ISeventvApiClient>(
    () => SeventvApiClientImpl(
      httpClient: HttpClient(),
    ),
  );
}

final getIt = GetIt.instance;
