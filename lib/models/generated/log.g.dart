// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) => Log(
      logLevel: $enumDecode(_$LogLevelEnumMap, json['LogLevel']),
      payload: json['Payload'] as String?,
    );

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
      'LogLevel': _$LogLevelEnumMap[instance.logLevel]!,
      'Payload': instance.payload,
    };

const _$LogLevelEnumMap = {
  LogLevel.debug: 'debug',
  LogLevel.info: 'info',
  LogLevel.warning: 'warning',
  LogLevel.error: 'error',
  LogLevel.silent: 'silent',
};
