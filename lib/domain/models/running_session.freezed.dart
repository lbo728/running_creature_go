// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'running_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RunningSession _$RunningSessionFromJson(Map<String, dynamic> json) {
  return _RunningSession.fromJson(json);
}

/// @nodoc
mixin _$RunningSession {
  String get id => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  double get averagePace => throw _privateConstructorUsedError;
  List<Position> get trackedPositions => throw _privateConstructorUsedError;
  RunningStatus get status => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RunningSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RunningSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RunningSessionCopyWith<RunningSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunningSessionCopyWith<$Res> {
  factory $RunningSessionCopyWith(
          RunningSession value, $Res Function(RunningSession) then) =
      _$RunningSessionCopyWithImpl<$Res, RunningSession>;
  @useResult
  $Res call(
      {String id,
      DateTime startTime,
      DateTime? endTime,
      Duration duration,
      double distance,
      double averagePace,
      List<Position> trackedPositions,
      RunningStatus status,
      bool isDeleted,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$RunningSessionCopyWithImpl<$Res, $Val extends RunningSession>
    implements $RunningSessionCopyWith<$Res> {
  _$RunningSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunningSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? duration = null,
    Object? distance = null,
    Object? averagePace = null,
    Object? trackedPositions = null,
    Object? status = null,
    Object? isDeleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      averagePace: null == averagePace
          ? _value.averagePace
          : averagePace // ignore: cast_nullable_to_non_nullable
              as double,
      trackedPositions: null == trackedPositions
          ? _value.trackedPositions
          : trackedPositions // ignore: cast_nullable_to_non_nullable
              as List<Position>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RunningStatus,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RunningSessionImplCopyWith<$Res>
    implements $RunningSessionCopyWith<$Res> {
  factory _$$RunningSessionImplCopyWith(_$RunningSessionImpl value,
          $Res Function(_$RunningSessionImpl) then) =
      __$$RunningSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime startTime,
      DateTime? endTime,
      Duration duration,
      double distance,
      double averagePace,
      List<Position> trackedPositions,
      RunningStatus status,
      bool isDeleted,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$RunningSessionImplCopyWithImpl<$Res>
    extends _$RunningSessionCopyWithImpl<$Res, _$RunningSessionImpl>
    implements _$$RunningSessionImplCopyWith<$Res> {
  __$$RunningSessionImplCopyWithImpl(
      _$RunningSessionImpl _value, $Res Function(_$RunningSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RunningSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? duration = null,
    Object? distance = null,
    Object? averagePace = null,
    Object? trackedPositions = null,
    Object? status = null,
    Object? isDeleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RunningSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      averagePace: null == averagePace
          ? _value.averagePace
          : averagePace // ignore: cast_nullable_to_non_nullable
              as double,
      trackedPositions: null == trackedPositions
          ? _value._trackedPositions
          : trackedPositions // ignore: cast_nullable_to_non_nullable
              as List<Position>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RunningStatus,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RunningSessionImpl implements _RunningSession {
  const _$RunningSessionImpl(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.duration,
      required this.distance,
      required this.averagePace,
      required final List<Position> trackedPositions,
      required this.status,
      this.isDeleted = false,
      required this.createdAt,
      required this.updatedAt})
      : _trackedPositions = trackedPositions;

  factory _$RunningSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunningSessionImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final Duration duration;
  @override
  final double distance;
  @override
  final double averagePace;
  final List<Position> _trackedPositions;
  @override
  List<Position> get trackedPositions {
    if (_trackedPositions is EqualUnmodifiableListView)
      return _trackedPositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackedPositions);
  }

  @override
  final RunningStatus status;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RunningSession(id: $id, startTime: $startTime, endTime: $endTime, duration: $duration, distance: $distance, averagePace: $averagePace, trackedPositions: $trackedPositions, status: $status, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.averagePace, averagePace) ||
                other.averagePace == averagePace) &&
            const DeepCollectionEquality()
                .equals(other._trackedPositions, _trackedPositions) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startTime,
      endTime,
      duration,
      distance,
      averagePace,
      const DeepCollectionEquality().hash(_trackedPositions),
      status,
      isDeleted,
      createdAt,
      updatedAt);

  /// Create a copy of RunningSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningSessionImplCopyWith<_$RunningSessionImpl> get copyWith =>
      __$$RunningSessionImplCopyWithImpl<_$RunningSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RunningSessionImplToJson(
      this,
    );
  }
}

abstract class _RunningSession implements RunningSession {
  const factory _RunningSession(
      {required final String id,
      required final DateTime startTime,
      required final DateTime? endTime,
      required final Duration duration,
      required final double distance,
      required final double averagePace,
      required final List<Position> trackedPositions,
      required final RunningStatus status,
      final bool isDeleted,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$RunningSessionImpl;

  factory _RunningSession.fromJson(Map<String, dynamic> json) =
      _$RunningSessionImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  Duration get duration;
  @override
  double get distance;
  @override
  double get averagePace;
  @override
  List<Position> get trackedPositions;
  @override
  RunningStatus get status;
  @override
  bool get isDeleted;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of RunningSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunningSessionImplCopyWith<_$RunningSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Position _$PositionFromJson(Map<String, dynamic> json) {
  return _Position.fromJson(json);
}

/// @nodoc
mixin _$Position {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  double get altitude => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;

  /// Serializes this Position to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PositionCopyWith<Position> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res, Position>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      DateTime timestamp,
      double accuracy,
      double altitude,
      double speed});
}

/// @nodoc
class _$PositionCopyWithImpl<$Res, $Val extends Position>
    implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? accuracy = null,
    Object? altitude = null,
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionImplCopyWith<$Res>
    implements $PositionCopyWith<$Res> {
  factory _$$PositionImplCopyWith(
          _$PositionImpl value, $Res Function(_$PositionImpl) then) =
      __$$PositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      DateTime timestamp,
      double accuracy,
      double altitude,
      double speed});
}

/// @nodoc
class __$$PositionImplCopyWithImpl<$Res>
    extends _$PositionCopyWithImpl<$Res, _$PositionImpl>
    implements _$$PositionImplCopyWith<$Res> {
  __$$PositionImplCopyWithImpl(
      _$PositionImpl _value, $Res Function(_$PositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? accuracy = null,
    Object? altitude = null,
    Object? speed = null,
  }) {
    return _then(_$PositionImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionImpl implements _Position {
  const _$PositionImpl(
      {required this.latitude,
      required this.longitude,
      required this.timestamp,
      this.accuracy = 0.0,
      this.altitude = 0.0,
      this.speed = 0.0});

  factory _$PositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final double accuracy;
  @override
  @JsonKey()
  final double altitude;
  @override
  @JsonKey()
  final double speed;

  @override
  String toString() {
    return 'Position(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, accuracy: $accuracy, altitude: $altitude, speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, latitude, longitude, timestamp, accuracy, altitude, speed);

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionImplCopyWith<_$PositionImpl> get copyWith =>
      __$$PositionImplCopyWithImpl<_$PositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionImplToJson(
      this,
    );
  }
}

abstract class _Position implements Position {
  const factory _Position(
      {required final double latitude,
      required final double longitude,
      required final DateTime timestamp,
      final double accuracy,
      final double altitude,
      final double speed}) = _$PositionImpl;

  factory _Position.fromJson(Map<String, dynamic> json) =
      _$PositionImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  DateTime get timestamp;
  @override
  double get accuracy;
  @override
  double get altitude;
  @override
  double get speed;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PositionImplCopyWith<_$PositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
