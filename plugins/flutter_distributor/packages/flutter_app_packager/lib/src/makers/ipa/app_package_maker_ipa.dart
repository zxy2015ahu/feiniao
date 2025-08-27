import 'dart:io';

import 'package:app_package_maker/app_package_maker.dart';

class AppPackageMakerIpa extends AppPackageMaker {
  @override
  String get name => 'ipa';
  @override
  String get platform => 'ios';
  @override
  String get packageFormat => 'ipa';

  @override
  Future<MakeResult> make(MakeConfig config) {
    File pkgFile = config.buildOutputFiles.first;
    pkgFile.copySync(config.outputFile.path);
    return Future.value(resultResolver.resolve(config));
  }
}
