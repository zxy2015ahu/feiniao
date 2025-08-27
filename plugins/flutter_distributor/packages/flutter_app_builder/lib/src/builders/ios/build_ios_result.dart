import 'dart:io';

import 'package:flutter_app_builder/src/build_config.dart';
import 'package:flutter_app_builder/src/build_result.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

class BuildIosResultResolver extends BuildResultResolver {
  @override
  BuildResult resolve(BuildConfig config, {Duration? duration}) {
    final r = BuildIosResult(config);
    final String pattern = '${r.outputDirectory.path}/**.ipa';
    List<FileSystemEntity> entities = Glob(pattern).listSync();
    List<File> pkgFiles = (entities.map((e) => File(e.path)).toList())
      ..sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));
    r.outputFiles = [pkgFiles.first];
    return r;
  }
}

class BuildIosResult extends BuildResult {
  BuildIosResult(BuildConfig config) : super(config);

  @override
  Directory get outputDirectory {
    String path = 'build/ios/ipa';
    return Directory(path);
  }
}
