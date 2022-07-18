import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:posts_app_with_test/common/constants/constants.dart';
import 'package:posts_app_with_test/common/pref/preference.dart';
import 'package:posts_app_with_test/di/service_locator.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit({required this.initialLocale}) : super(initialLocale) {
    _setInitialLocale();
  }

  final Locale initialLocale;

  Future<void> changeLocale() async {
    final currentAppLocale = await getCurrentLocale();
    if (currentAppLocale == 'en') {
      await sl<Preference>().saveString(Constants.localePrefKey, 'bn');
      emit(const Locale('bn'));
    } else {
      await sl<Preference>().saveString(Constants.localePrefKey, 'en');
      emit(const Locale('en'));
    }
  }

  Future<String?> getCurrentLocale() async {
    return sl<Preference>().getString(Constants.localePrefKey);
  }

  Future<void> _setInitialLocale() async {
    await sl<Preference>()
        .saveString(Constants.localePrefKey, initialLocale.languageCode);
  }
}
