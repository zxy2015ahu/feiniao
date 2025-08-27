import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'constant.dart';

class AppPath {
  static AppPath? _instance;
  Completer<Directory> applicationSupportDirectoryCompleter = Completer();

  AppPath._internal() {
    getApplicationSupportDirectory().then(
      (value) => applicationSupportDirectoryCompleter.complete(value),
    );
  }

  factory AppPath() {
    _instance ??= AppPath._internal();
    return _instance!;
  }

  Future<String> getHomeDirPath() async {
    final directory = await applicationSupportDirectoryCompleter.future;
    return directory.path;
  }

  Future<String> getConfigPath() async {
    final directory = await applicationSupportDirectoryCompleter.future;
    return join(directory.path, appConstant.configFileName);
  }

  Future<String> getProfilesPath() async {
    final directory = await applicationSupportDirectoryCompleter.future;
    return join(directory.path, appConstant.profilesDirectoryName);
  }

  Future<String?> getProfilePath(String? id) async {
    if (id == null) return null;
    final directory = await getProfilesPath();
    return join(directory, "$id.yaml");
  }

  Future<String> getMMDBPath() async {
    var directory = await applicationSupportDirectoryCompleter.future;
    return join(directory.path, appConstant.mmdbFileName);
  }
}

final appPath = AppPath();
