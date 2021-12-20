import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [
      // "test_driver/features/List.feature",
      // "test_driver/features/Favorites.feature",
      "test_driver/features/Login.feature",
    ] //Glob(r"test_driver/features/**.feature")
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      CheckGivenWidgets(),
      ClickLoginButton(),
      CheckIfHomePageIsPresent(),
      TapThumbUpButtonNTimes(),
      TapFavouratePage(),
      MakeFavourates(),
      ScrollTillItemVisible()
    ]
    ..restartAppBetweenScenarios =
        false //должно быть, иначе нарушается сортировка
    //элементов
    ..targetAppPath = "test_driver/app.dart";
  return GherkinRunner().execute(config);
}
