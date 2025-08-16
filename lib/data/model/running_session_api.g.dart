// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'running_session_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RunningSessionApi _$RunningSessionApiFromJson(Map<String, dynamic> json) =>
    RunningSessionApi(
      id: json['id'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String?,
      durationSeconds: (json['duration_seconds'] as num).toInt(),
      distance: (json['distance'] as num).toDouble(),
      averagePace: (json['average_pace'] as num).toDouble(),
      trackedPositions: (json['tracked_positions'] as List<dynamic>)
          .map((e) => PositionApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num).toInt(),
      isDeleted: json['is_deleted'] as bool? ?? false,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$RunningSessionApiToJson(RunningSessionApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration_seconds': instance.durationSeconds,
      'distance': instance.distance,
      'average_pace': instance.averagePace,
      'tracked_positions': instance.trackedPositions,
      'status': instance.status,
    };

PositionApi _$PositionApiFromJson(Map<String, dynamic> json) => PositionApi(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: json['timestamp'] as String,
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      altitude: (json['altitude'] as num?)?.toDouble() ?? 0.0,
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$PositionApiToJson(PositionApi instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp,
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'speed': instance.speed,
    };
