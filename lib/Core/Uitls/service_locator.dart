import 'package:bagstore/Feature/AuthView/login/data/repos/login_repo.dart';
import 'package:bagstore/Feature/AuthView/login/data/repos/login_repo_impl.dart';

import 'package:bagstore/Feature/AuthView/login/presentation/manger/cubit/login_cubit.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/manger/cubit/onbording_cubit.dart';
import 'package:bagstore/Feature/OnBordingView/data/repositories/onbording_repo.dart';
import 'package:get_it/get_it.dart';

import '../../Feature/OnBordingView/data/repositories/onbording_repo_impl.dart';
// import 'package:bag/Feature/OnBordingView/data/repositories/onbording_repo_impl.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    // await _setupForExternal();

    // _setupForCore();

    _setupForRepos();

    _setupForCubits();
  }

  // Future<void> _setupForExternal() async {
  //   serviceLocator.registerLazySingleton<InternetConnectionChecker>(
  //     () => InternetConnectionChecker(),
  //   );
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   serviceLocator
  //       .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // serviceLocator.registerLazySingleton<AppInterceptors>(
  //   () => AppInterceptors(),
  //  );

  // serviceLocator.registerLazySingleton<LogInterceptor>(
  //   () => LogInterceptor(
  //     request: true,
  //     requestBody: true,
  //     requestHeader: true,
  //     responseBody: true,
  //     responseHeader: true,
  //     error: true,
  //   ),
  // );

  //   serviceLocator.registerLazySingleton<Dio>(() => Dio());
  // }

  // void _setupForCore() {
  //   // serviceLocator.registerLazySingleton<NetworkInfo>(
  //   //   () => NetworkInfoImpl(
  //   //     connectionChecker: serviceLocator.get<InternetConnectionChecker>(),
  //   //   ),
  //   // );

  //   serviceLocator.registerLazySingleton<CacheHelper>(
  //     () => CacheHelper(serviceLocator<SharedPreferences>()),
  //   );

  //   serviceLocator.registerLazySingleton<DioConsumer>(
  //       () => DioConsumer(serviceLocator.get()));
  // }

  void _setupForRepos() {
    serviceLocator
        .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());
    serviceLocator.registerLazySingleton<LoginRepo>(() => LoginRepoImpl());

    // serviceLocator.registerLazySingleton<ForgetPasswordRepo>(
    //     () => ForgetPasswordRepoImpl(dioConsumer: serviceLocator.get()));
    // serviceLocator.registerLazySingleton<SignUpRepo>(
    //     () => SingUpRepoImpl(dioConsumer: serviceLocator.get<DioConsumer>()));
    // serviceLocator.registerLazySingleton<VerificationRepo>(() =>
    //     VerificationRepoImpl(dioConsumer: serviceLocator.get<DioConsumer>()));
  }

  void _setupForCubits() {
    serviceLocator.registerFactory<OnbordingCubit>(
      () =>
          OnbordingCubit(onBoardingRepo: serviceLocator.get<OnBoardingRepo>()),
    );

    // serviceLocator.registerFactory<ForgetPasswordCubit>(() =>
    //     ForgetPasswordCubit(
    //         forgetPasswordRepo: serviceLocator.get<ForgetPasswordRepo>()));
    serviceLocator.registerFactory<LoginCubit>(
        () => LoginCubit(loginRepo: serviceLocator.get<LoginRepo>()));
    // serviceLocator.registerFactory<SignUpCubit>(
    //     () => SignUpCubit(registerRepo: serviceLocator.get<SignUpRepo>()));
    // serviceLocator.registerFactory<VerificationCubit>(() => VerificationCubit(
    //     verificationRepo: serviceLocator.get<VerificationRepo>()));
  }
}
