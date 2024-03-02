import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kafil/core/app_router.dart';
import 'package:kafil/core/network/base_requests.dart';
import 'package:kafil/core/network/network.dart';
import 'package:kafil/export.dart';
import 'package:kafil/features/auth/domain/usecases/usecases.dart';
import 'package:kafil/features/auth/presentation/cubit.dart';
import 'package:kafil/features/countries/domain/usecases/usecases.dart';
import 'package:kafil/features/countries/presentation/countries_cubit.dart';
import 'package:kafil/features/home/domain/usecases/usecases.dart';
import 'package:kafil/features/home/presentation/bloc/home_bloc.dart';
import 'package:kafil/features/profile/domain/usecases/usecases.dart';
import 'package:kafil/features/profile/presentation/profile_cubit.dart';
import 'package:kafil/features/services/domain/usecases/usecases.dart';
import 'package:kafil/features/services/presentation/services_cubit.dart';
import 'package:requests_inspector/requests_inspector.dart';

import 'feature/data/repositories/repository_imp.dart';
import 'feature/domain/repositories/repositories.dart';
import 'network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - posts
  // Bloc
  sl.registerFactory(() => AuthCubit(useCase: sl(), box: sl()));
  sl.registerFactory(() => ServicesCubit(useCase: sl()));
  sl.registerFactory(() => ServicesCubit(useCase: sl()),
      instanceName: kPopular);
  sl.registerFactory(() => ProfileCubit(useCase: sl()));
  sl.registerFactory(() => HomeBloc(useCase: sl()));
  sl.registerFactory(() => CountriesCubit(useCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => AuthUseCase(repository: sl()));
  sl.registerLazySingleton(() => TeachersUseCase(repository: sl()));
  sl.registerLazySingleton(() => CountriesUseCase(repository: sl()));
  sl.registerLazySingleton(() => ServicesUseCase(repository: sl()));
  sl.registerLazySingleton(() => HomeUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<Repository>(() => RepoImp(remoteDataSource: sl()));

  // Datasources
  sl.registerLazySingleton<BaseRequests>(
      () => BaseRequests(network: sl(), networkInfo: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<Network>(() => Network(dio: sl(), box: sl()));

  //! External
  sl.registerLazySingleton(() => GetStorage());
  sl.registerLazySingleton(() => AppRouter());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 1000),
      receiveTimeout: const Duration(seconds: 1000),
      validateStatus: (_) => true))
    ..interceptors.add(RequestsInspectorInterceptor()));
}
