// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'running_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RunningSessionImpl _$$RunningSessionImplFromJson(Map<String, dynamic> json) =>
    _$RunningSessionImpl(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      distance: (json['distance'] as num).toDouble(),
      averagePace: (json['averagePace'] as num).toDouble(),
      trackedPositions: (json['trackedPositions'] as List<dynamic>)
          .map((e) => Position.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$RunningStatusEnumMap, json['status']),
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RunningSessionImplToJson(
        _$RunningSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
      'distance': instance.distance,
      'averagePace': instance.averagePace,
      'trackedPositions': instance.trackedPositions,
      'status': _$RunningStatusEnumMap[instance.status]!,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$RunningStatusEnumMap = {
  RunningStatus.notStarted: 0,
  RunningStatus.running: 1,
  RunningStatus.paused: 2,
  RunningStatus.completed: 3,
};

_$PositionImpl _$$PositionImplFromJson(Map<String, dynamic> json) =>
    _$PositionImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      altitude: (json['altitude'] as num?)?.toDouble() ?? 0.0,
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$PositionImplToJson(_$PositionImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp.toIso8601String(),
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'speed': instance.speed,
    };
