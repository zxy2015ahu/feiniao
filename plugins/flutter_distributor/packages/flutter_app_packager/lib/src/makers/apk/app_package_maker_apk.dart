import 'package:app_package_maker/app_package_maker.dart';

class AppPackageMakerApk extends AppPackageMaker {
  @override
  String get name => 'apk';

  @override
  String get platform => 'android';

  @override
  String get packageFormat => 'apk';

  @override
  Future<MakeResult> make(MakeConfig config) {
    for (final file in config.buildOutputFiles) {
      final splits = file.uri.pathSegments.last.split('-');
      if (splits.length > 2) {
        final sublist = splits.sublist(1, splits.length - 1);
        final outputSplits = config.outputFile.path.split('.');
        final output = '${outputSplits.first}-${sublist.join('-')}.${outputSplits.last}';
        file.copySync(output);
      }
    }
    return Future.value(resultResolver.resolve(config));
  }
}
