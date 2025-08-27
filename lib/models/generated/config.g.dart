// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessControl _$AccessControlFromJson(Map<String, dynamic> json) =>
    AccessControl(
      isFilterSystemApp: json['isFilterSystemApp'] as bool? ?? true,
      mode: $enumDecodeNullable(_$AccessControlModeEnumMap, json['mode']) ??
          AccessControlMode.rejectSelected,
      acceptList: (json['acceptList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rejectList: (json['rejectList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AccessControlToJson(AccessControl instance) =>
    <String, dynamic>{
      'mode': _$AccessControlModeEnumMap[instance.mode]!,
      'acceptList': instance.acceptList,
      'rejectList': instance.rejectList,
      'isFilterSystemApp': instance.isFilterSystemApp,
    };

const _$AccessControlModeEnumMap = {
  AccessControlMode.acceptSelected: 'acceptSelected',
  AccessControlMode.rejectSelected: 'rejectSelected',
};

Config _$ConfigFromJson(Map<String, dynamic> json) => Config()
  ..profiles = (json['profiles'] as List<dynamic>?)
          ?.map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..currentProfileId = json['currentProfileId'] as String?
  ..autoLaunch = json['autoLaunch'] as bool? ?? false
  ..silentLaunch = json['silentLaunch'] as bool? ?? false
  ..autoRun = json['autoRun'] as bool? ?? false
  ..themeMode = $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system
  ..openLogs = json['openLogs'] as bool? ?? false
  ..locale = json['locale'] as String?
  ..primaryColor = (json['primaryColor'] as num?)?.toInt()
  ..proxiesSortType =
      $enumDecodeNullable(_$ProxiesSortTypeEnumMap, json['proxiesSortType']) ??
          ProxiesSortType.none
  ..isMinimizeOnExit = json['isMinimizeOnExit'] as bool? ?? true
  ..isAccessControl = json['isAccessControl'] as bool? ?? false
  ..accessControl =
      AccessControl.fromJson(json['accessControl'] as Map<String, dynamic>)
  ..isAnimateToPage = json['isAnimateToPage'] as bool? ?? true;

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'profiles': instance.profiles,
      'currentProfileId': instance.currentProfileId,
      'autoLaunch': instance.autoLaunch,
      'silentLaunch': instance.silentLaunch,
      'autoRun': instance.autoRun,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'openLogs': instance.openLogs,
      'locale': instance.locale,
      'primaryColor': instance.primaryColor,
      'proxiesSortType': _$ProxiesSortTypeEnumMap[instance.proxiesSortType]!,
      'isMinimizeOnExit': instance.isMinimizeOnExit,
      'isAccessControl': instance.isAccessControl,
      'accessControl': instance.accessControl,
      'isAnimateToPage': instance.isAnimateToPage,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$ProxiesSortTypeEnumMap = {
  ProxiesSortType.none: 'none',
  ProxiesSortType.delay: 'delay',
  ProxiesSortType.name: 'name',
};
