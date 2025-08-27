import 'dart:io';

import 'package:app_package_maker/app_package_maker.dart';
import 'package:path/path.dart' as p;


class MakeExeConfig extends MakeConfig {
  MakeExeConfig({
    this.scriptTemplate,
    required this.appId,
    this.executableName,
    this.displayName,
    this.publisherName,
    this.publisherUrl,
    this.createDesktopIcon,
    this.launchAtStartup,
    this.installDirName,
    this.setupIconFile,
    this.privilegesRequired,
    this.locales,
  });

  factory MakeExeConfig.fromJson(Map<String, dynamic> json) {
    List<Map<String,dynamic>>? locales = json['locales'] != null
        ? List<Map<String,dynamic>>.from(json['locales'])
        : null;
    print(locales);
    if (locales == null || locales.isEmpty) locales = [{'lang': 'en'}];

    MakeExeConfig makeExeConfig = MakeExeConfig(
      scriptTemplate: json['script_template'],
      appId: json['app_id'] ?? json['appId'],
      executableName: json['executable_name'],
      displayName: json['display_name'],
      publisherName: json['publisher_name'] ?? json['appPublisher'],
      publisherUrl: json['publisher_url'] ?? json['appPublisherUrl'],
      createDesktopIcon: json['create_desktop_icon'],
      launchAtStartup: json['launch_at_startup'],
      installDirName: json['install_dir_name'],
      setupIconFile: json['setup_icon_file'],
      privilegesRequired: json['privileges_required'],
      locales: locales,
    );
    return makeExeConfig;
  }

  String? scriptTemplate;
  final String appId;
  String? executableName;
  String? displayName;
  String? publisherName;
  String? publisherUrl;
  bool? createDesktopIcon;
  bool? launchAtStartup;
  String? installDirName;
  String? setupIconFile;
  String? privilegesRequired;
  List<Map<String,dynamic>>? locales;

  String get defaultExecutableName {
    File executableFile = packagingDirectory
        .listSync()
        .where((e) => e.path.endsWith('.exe'))
        .map((e) => File(e.path))
        .first;
    return p.basename(executableFile.path);
  }

  String get defaultInstallDirName => '{autopf64}\\$appName';

  String get sourceDir => p.basename(packagingDirectory.path);

  String get outputBaseFileName =>
      p.basename(outputFile.path).replaceAll('.exe', '');

  @override
  Map<String, dynamic> toJson() {
    return {
      'script_template': scriptTemplate,
      'app_id': appId,
      'app_name': appName,
      'app_version': appVersion.toString(),
      'executable_name': executableName,
      'display_name': displayName,
      'publisher_name': publisherName,
      'publisher_url': publisherUrl,
      'create_desktop_icon': createDesktopIcon,
      'launch_at_startup': launchAtStartup,
      'install_dir_name': installDirName,
      'setup_icon_file': setupIconFile,
      'privileges_required': privilegesRequired,
      'locales': locales,
    }..removeWhere((key, value) => value == null);
  }
}

class MakeExeConfigLoader extends DefaultMakeConfigLoader {
  @override
  MakeConfig load(
    Map<String, dynamic>? arguments,
    Directory outputDirectory, {
    required Directory buildOutputDirectory,
    required List<File> buildOutputFiles,
  }) {
    final baseMakeConfig = super.load(
      arguments,
      outputDirectory,
      buildOutputDirectory: buildOutputDirectory,
      buildOutputFiles: buildOutputFiles,
    );
    final map = loadMakeConfigYaml(
      '$platform/packaging/$packageFormat/make_config.yaml',
    );
    return MakeExeConfig.fromJson(map).copyWith(baseMakeConfig)
      ..isInstaller = true;
  }
}
