import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:posts_app_with_test/common/constants/constants.dart';
import 'package:posts_app_with_test/common/pref/preference.dart';
import 'package:posts_app_with_test/common/ui/localization_cubit/localization_cubit.dart';
import 'package:posts_app_with_test/posts/Ui/cubit/post_cubit.dart';
import 'package:posts_app_with_test/posts/data/repository/data_sources/post_remote_data_source.dart';
import 'package:posts_app_with_test/posts/data/repository/implementation/post_repository_impl.dart';
import 'package:posts_app_with_test/posts/domain/usecase/post_usecase.dart';

GetIt sl = GetIt.I;

Future<void> setUpServiceLocators() async {
  await sl.reset();
  sl
    ..registerSingleton<Preference>(Preference())
    ..registerSingletonAsync(
      () async => LocalizationCubit(
        initialLocale: Locale(
          await sl<Preference>().getString(Constants.localePrefKey) ?? 'en',
        ),
      ),
    )
    ..registerFactory(PostRepositoryImpl.new)
    ..registerFactory(PostCubit.new)
    ..registerFactory(PostRemoteDataSourceImpl.new)
    ..registerFactory(PostUseCase.new);
  await sl.allReady();
}
