// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:posts_app_with_test/app/app.dart';
import 'package:posts_app_with_test/bootstrap.dart';
import 'package:posts_app_with_test/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocators();
  await bootstrap(() => const App());
}
