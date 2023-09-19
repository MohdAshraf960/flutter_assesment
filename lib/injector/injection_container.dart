import 'package:currency/core/core.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:currency/services/service.dart';

final getIt = GetIt.instance;

Future<void> injector() async {
  getIt.registerLazySingleton<BitcoinService>(
    () => BitcoinService(
      dioClient: getIt<DioClient>(),
    ),
  );

  getIt.registerLazySingleton(() => DioClient(Dio()));
}
