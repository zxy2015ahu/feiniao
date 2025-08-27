// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../ffi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateConfigParams _$UpdateConfigParamsFromJson(Map<String, dynamic> json) {
  return _UpdateConfigParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateConfigParams {
  @JsonKey(name: "profile-path")
  String? get profilePath => throw _privateConstructorUsedError;
  ClashConfig get config => throw _privateConstructorUsedError;
  @JsonKey(name: "is-patch")
  bool? get isPatch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateConfigParamsCopyWith<UpdateConfigParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateConfigParamsCopyWith<$Res> {
  factory $UpdateConfigParamsCopyWith(
          UpdateConfigParams value, $Res Function(UpdateConfigParams) then) =
      _$UpdateConfigParamsCopyWithImpl<$Res, UpdateConfigParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "profile-path") String? profilePath,
      ClashConfig config,
      @JsonKey(name: "is-patch") bool? isPatch});
}

/// @nodoc
class _$UpdateConfigParamsCopyWithImpl<$Res, $Val extends UpdateConfigParams>
    implements $UpdateConfigParamsCopyWith<$Res> {
  _$UpdateConfigParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePath = freezed,
    Object? config = null,
    Object? isPatch = freezed,
  }) {
    return _then(_value.copyWith(
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as ClashConfig,
      isPatch: freezed == isPatch
          ? _value.isPatch
          : isPatch // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateConfigParamsImplCopyWith<$Res>
    implements $UpdateConfigParamsCopyWith<$Res> {
  factory _$$UpdateConfigParamsImplCopyWith(_$UpdateConfigParamsImpl value,
          $Res Function(_$UpdateConfigParamsImpl) then) =
      __$$UpdateConfigParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "profile-path") String? profilePath,
      ClashConfig config,
      @JsonKey(name: "is-patch") bool? isPatch});
}

/// @nodoc
class __$$UpdateConfigParamsImplCopyWithImpl<$Res>
    extends _$UpdateConfigParamsCopyWithImpl<$Res, _$UpdateConfigParamsImpl>
    implements _$$UpdateConfigParamsImplCopyWith<$Res> {
  __$$UpdateConfigParamsImplCopyWithImpl(_$UpdateConfigParamsImpl _value,
      $Res Function(_$UpdateConfigParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePath = freezed,
    Object? config = null,
    Object? isPatch = freezed,
  }) {
    return _then(_$UpdateConfigParamsImpl(
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as ClashConfig,
      isPatch: freezed == isPatch
          ? _value.isPatch
          : isPatch // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateConfigParamsImpl implements _UpdateConfigParams {
  const _$UpdateConfigParamsImpl(
      {@JsonKey(name: "profile-path") this.profilePath,
      required this.config,
      @JsonKey(name: "is-patch") this.isPatch});

  factory _$UpdateConfigParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateConfigParamsImplFromJson(json);

  @override
  @JsonKey(name: "profile-path")
  final String? profilePath;
  @override
  final ClashConfig config;
  @override
  @JsonKey(name: "is-patch")
  final bool? isPatch;

  @override
  String toString() {
    return 'UpdateConfigParams(profilePath: $profilePath, config: $config, isPatch: $isPatch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateConfigParamsImpl &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.isPatch, isPatch) || other.isPatch == isPatch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, profilePath, config, isPatch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateConfigParamsImplCopyWith<_$UpdateConfigParamsImpl> get copyWith =>
      __$$UpdateConfigParamsImplCopyWithImpl<_$UpdateConfigParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateConfigParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateConfigParams implements UpdateConfigParams {
  const factory _UpdateConfigParams(
          {@JsonKey(name: "profile-path") final String? profilePath,
          required final ClashConfig config,
          @JsonKey(name: "is-patch") final bool? isPatch}) =
      _$UpdateConfigParamsImpl;

  factory _UpdateConfigParams.fromJson(Map<String, dynamic> json) =
      _$UpdateConfigParamsImpl.fromJson;

  @override
  @JsonKey(name: "profile-path")
  String? get profilePath;
  @override
  ClashConfig get config;
  @override
  @JsonKey(name: "is-patch")
  bool? get isPatch;
  @override
  @JsonKey(ignore: true)
  _$$UpdateConfigParamsImplCopyWith<_$UpdateConfigParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChangeProxyParams _$ChangeProxyParamsFromJson(Map<String, dynamic> json) {
  return _ChangeProxyParams.fromJson(json);
}

/// @nodoc
mixin _$ChangeProxyParams {
  @JsonKey(name: "group-name")
  String get groupName => throw _privateConstructorUsedError;
  @JsonKey(name: "proxy-name")
  String get proxyName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeProxyParamsCopyWith<ChangeProxyParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeProxyParamsCopyWith<$Res> {
  factory $ChangeProxyParamsCopyWith(
          ChangeProxyParams value, $Res Function(ChangeProxyParams) then) =
      _$ChangeProxyParamsCopyWithImpl<$Res, ChangeProxyParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "group-name") String groupName,
      @JsonKey(name: "proxy-name") String proxyName});
}

/// @nodoc
class _$ChangeProxyParamsCopyWithImpl<$Res, $Val extends ChangeProxyParams>
    implements $ChangeProxyParamsCopyWith<$Res> {
  _$ChangeProxyParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
    Object? proxyName = null,
  }) {
    return _then(_value.copyWith(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      proxyName: null == proxyName
          ? _value.proxyName
          : proxyName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeProxyParamsImplCopyWith<$Res>
    implements $ChangeProxyParamsCopyWith<$Res> {
  factory _$$ChangeProxyParamsImplCopyWith(_$ChangeProxyParamsImpl value,
          $Res Function(_$ChangeProxyParamsImpl) then) =
      __$$ChangeProxyParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "group-name") String groupName,
      @JsonKey(name: "proxy-name") String proxyName});
}

/// @nodoc
class __$$ChangeProxyParamsImplCopyWithImpl<$Res>
    extends _$ChangeProxyParamsCopyWithImpl<$Res, _$ChangeProxyParamsImpl>
    implements _$$ChangeProxyParamsImplCopyWith<$Res> {
  __$$ChangeProxyParamsImplCopyWithImpl(_$ChangeProxyParamsImpl _value,
      $Res Function(_$ChangeProxyParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
    Object? proxyName = null,
  }) {
    return _then(_$ChangeProxyParamsImpl(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      proxyName: null == proxyName
          ? _value.proxyName
          : proxyName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangeProxyParamsImpl implements _ChangeProxyParams {
  const _$ChangeProxyParamsImpl(
      {@JsonKey(name: "group-name") required this.groupName,
      @JsonKey(name: "proxy-name") required this.proxyName});

  factory _$ChangeProxyParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangeProxyParamsImplFromJson(json);

  @override
  @JsonKey(name: "group-name")
  final String groupName;
  @override
  @JsonKey(name: "proxy-name")
  final String proxyName;

  @override
  String toString() {
    return 'ChangeProxyParams(groupName: $groupName, proxyName: $proxyName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeProxyParamsImpl &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.proxyName, proxyName) ||
                other.proxyName == proxyName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, groupName, proxyName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeProxyParamsImplCopyWith<_$ChangeProxyParamsImpl> get copyWith =>
      __$$ChangeProxyParamsImplCopyWithImpl<_$ChangeProxyParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangeProxyParamsImplToJson(
      this,
    );
  }
}

abstract class _ChangeProxyParams implements ChangeProxyParams {
  const factory _ChangeProxyParams(
          {@JsonKey(name: "group-name") required final String groupName,
          @JsonKey(name: "proxy-name") required final String proxyName}) =
      _$ChangeProxyParamsImpl;

  factory _ChangeProxyParams.fromJson(Map<String, dynamic> json) =
      _$ChangeProxyParamsImpl.fromJson;

  @override
  @JsonKey(name: "group-name")
  String get groupName;
  @override
  @JsonKey(name: "proxy-name")
  String get proxyName;
  @override
  @JsonKey(ignore: true)
  _$$ChangeProxyParamsImplCopyWith<_$ChangeProxyParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  MessageType get type => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({MessageType type, dynamic data});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MessageType type, dynamic data});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? data = freezed,
  }) {
    return _then(_$MessageImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl({required this.type, this.data});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final MessageType type;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'Message(type: $type, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final MessageType type, final dynamic data}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  MessageType get type;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Delay _$DelayFromJson(Map<String, dynamic> json) {
  return _Delay.fromJson(json);
}

/// @nodoc
mixin _$Delay {
  String get name => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DelayCopyWith<Delay> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DelayCopyWith<$Res> {
  factory $DelayCopyWith(Delay value, $Res Function(Delay) then) =
      _$DelayCopyWithImpl<$Res, Delay>;
  @useResult
  $Res call({String name, int? value});
}

/// @nodoc
class _$DelayCopyWithImpl<$Res, $Val extends Delay>
    implements $DelayCopyWith<$Res> {
  _$DelayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DelayImplCopyWith<$Res> implements $DelayCopyWith<$Res> {
  factory _$$DelayImplCopyWith(
          _$DelayImpl value, $Res Function(_$DelayImpl) then) =
      __$$DelayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int? value});
}

/// @nodoc
class __$$DelayImplCopyWithImpl<$Res>
    extends _$DelayCopyWithImpl<$Res, _$DelayImpl>
    implements _$$DelayImplCopyWith<$Res> {
  __$$DelayImplCopyWithImpl(
      _$DelayImpl _value, $Res Function(_$DelayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = freezed,
  }) {
    return _then(_$DelayImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DelayImpl implements _Delay {
  const _$DelayImpl({required this.name, this.value});

  factory _$DelayImpl.fromJson(Map<String, dynamic> json) =>
      _$$DelayImplFromJson(json);

  @override
  final String name;
  @override
  final int? value;

  @override
  String toString() {
    return 'Delay(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DelayImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DelayImplCopyWith<_$DelayImpl> get copyWith =>
      __$$DelayImplCopyWithImpl<_$DelayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DelayImplToJson(
      this,
    );
  }
}

abstract class _Delay implements Delay {
  const factory _Delay({required final String name, final int? value}) =
      _$DelayImpl;

  factory _Delay.fromJson(Map<String, dynamic> json) = _$DelayImpl.fromJson;

  @override
  String get name;
  @override
  int? get value;
  @override
  @JsonKey(ignore: true)
  _$$DelayImplCopyWith<_$DelayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Process _$ProcessFromJson(Map<String, dynamic> json) {
  return _Process.fromJson(json);
}

/// @nodoc
mixin _$Process {
  int get uid => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessCopyWith<Process> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessCopyWith<$Res> {
  factory $ProcessCopyWith(Process value, $Res Function(Process) then) =
      _$ProcessCopyWithImpl<$Res, Process>;
  @useResult
  $Res call({int uid, String network, String source, String target});
}

/// @nodoc
class _$ProcessCopyWithImpl<$Res, $Val extends Process>
    implements $ProcessCopyWith<$Res> {
  _$ProcessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? network = null,
    Object? source = null,
    Object? target = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessImplCopyWith<$Res> implements $ProcessCopyWith<$Res> {
  factory _$$ProcessImplCopyWith(
          _$ProcessImpl value, $Res Function(_$ProcessImpl) then) =
      __$$ProcessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int uid, String network, String source, String target});
}

/// @nodoc
class __$$ProcessImplCopyWithImpl<$Res>
    extends _$ProcessCopyWithImpl<$Res, _$ProcessImpl>
    implements _$$ProcessImplCopyWith<$Res> {
  __$$ProcessImplCopyWithImpl(
      _$ProcessImpl _value, $Res Function(_$ProcessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? network = null,
    Object? source = null,
    Object? target = null,
  }) {
    return _then(_$ProcessImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessImpl implements _Process {
  const _$ProcessImpl(
      {required this.uid,
      required this.network,
      required this.source,
      required this.target});

  factory _$ProcessImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessImplFromJson(json);

  @override
  final int uid;
  @override
  final String network;
  @override
  final String source;
  @override
  final String target;

  @override
  String toString() {
    return 'Process(uid: $uid, network: $network, source: $source, target: $target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, network, source, target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessImplCopyWith<_$ProcessImpl> get copyWith =>
      __$$ProcessImplCopyWithImpl<_$ProcessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessImplToJson(
      this,
    );
  }
}

abstract class _Process implements Process {
  const factory _Process(
      {required final int uid,
      required final String network,
      required final String source,
      required final String target}) = _$ProcessImpl;

  factory _Process.fromJson(Map<String, dynamic> json) = _$ProcessImpl.fromJson;

  @override
  int get uid;
  @override
  String get network;
  @override
  String get source;
  @override
  String get target;
  @override
  @JsonKey(ignore: true)
  _$$ProcessImplCopyWith<_$ProcessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
