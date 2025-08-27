import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import 'constant.dart';

class Preferences {
  static Preferences? _instance;
  Completer<SharedPreferences> sharedPreferencesCompleter = Completer();

  Preferences._internal() {
    SharedPreferences.getInstance()
        .then((value) => sharedPreferencesCompleter.complete(value));
  }

  factory Preferences() {
    _instance ??= Preferences._internal();
    return _instance!;
  }

  Future<ClashConfig?> getClashConfig() async {
    final preferences = await sharedPreferencesCompleter.future;
    final clashConfigString = preferences.getString(appConstant.clashKey);
    if (clashConfigString == null) return null;
    final clashConfigMap = json.decode(clashConfigString);
    try {
      return ClashConfig.fromJson(clashConfigMap);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool> saveClashConfig(ClashConfig clashConfig) async {
    final preferences = await sharedPreferencesCompleter.future;
    return preferences.setString(
      appConstant.clashKey,
      json.encode(clashConfig),
    );
  }

  Future<Config?> getConfig() async {
    final preferences = await sharedPreferencesCompleter.future;
    final configString = preferences.getString(appConstant.configKey);
    if (configString == null) return null;
    final configMap = json.decode(configString);
    try {
      return Config.fromJson(configMap);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool> saveConfig(Config config) async {
    final preferences = await sharedPreferencesCompleter.future;
    return preferences.setString(
      appConstant.configKey,
      json.encode(config),
    );
  }

  clearPreferences() async {
    final sharedPreferencesIns = await sharedPreferencesCompleter.future;
    sharedPreferencesIns.clear();
  }
}

final preferences = Preferences();