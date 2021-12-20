import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgets
    extends Given3WithWorld<String, String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3) async {
    final textinput1 = find.byValueKey(input1);
    final textinput2 = find.byValueKey(input2);
    final button = find.byValueKey(input3);
    bool input1Exists =
        await FlutterDriverUtils.isPresent(world.driver, textinput1);
    bool input2Exists = await FlutterDriverUtils.isPresent(
      world.driver,
      textinput2,
    );
    bool buttonExists =
        await FlutterDriverUtils.isPresent(world.driver, button);
    expect(input1Exists, true);
    expect(input2Exists, true);
    expect(buttonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string} and {string} and {string}");
}

class ClickLoginButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String loginbtn) async {
    final loginfinder = find.byValueKey(loginbtn);
    await FlutterDriverUtils.tap(world.driver, loginfinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class CheckIfHomePageIsPresent extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final homefinder = find.byValueKey(input1);
    bool isPresent =
        await FlutterDriverUtils.isPresent(world.driver, homefinder);
    expect(isPresent, true);
  }

  @override
  RegExp get pattern => RegExp("I have {string} on screen");
}

class TapThumbUpButtonNTimes extends When2WithWorld<String, int, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, int n) async {
    final buttonfinder = find.byValueKey(input1);
    for (var i = 0; i < n; i++) {
      await FlutterDriverUtils.tap(world.driver, buttonfinder);
    }
  }

  @override
  RegExp get pattern => RegExp(r"I tap {string} button {int} times");
}

class MakeFavourates extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    for (var i = 0; i < 4; i++) {
      var buttonfinder = find.byValueKey(input1);
      await FlutterDriverUtils.tap(world.driver, buttonfinder);
      input1 = "like" + (i + 1).toString();
    }
  }

  @override
  RegExp get pattern => RegExp(r"I tap {string} button");
}

class TapFavouratePage extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final fav_finder = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, fav_finder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap {string} page");
}

class ScrollTillItemVisible
    extends Then2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String listKey, String itemKey) async {
    final listFinder = find.byValueKey(listKey);
    final itemfinder = find.byValueKey(itemKey);
    bool isPresent = false;
    while (!isPresent) {
      await world.driver.scroll(
          listFinder, 0.0, -1000.0, const Duration(milliseconds: 300),
          timeout: Duration(seconds: 20));
      isPresent = await FlutterDriverUtils.isPresent(world.driver, itemfinder);
    }
  }

  @override
  RegExp get pattern => RegExp(r"I scroll {string} till {string} is visible");
}
