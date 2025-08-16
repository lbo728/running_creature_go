import 'package:json_annotation/json_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'running_session_api.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RunningSessionApi {
  final String id;
  final String startTime;
  final String? endTime;
  final int durationSeconds;
  final double distance;
  final double averagePace;
  final List<PositionApi> trackedPositions;
  final int status;
  @JsonKey(includeFromJson: true, includeToJson: false)
  final bool isDeleted;
  @JsonKey(includeFromJson: true, includeToJson: false)
  final String createdAt;
  @JsonKey(includeFromJson: true, includeToJson: false)
  final String updatedAt;

  const RunningSessionApi({
    required this.id,
    required this.startTime,
    this.endTime,
    required this.durationSeconds,
    required this.distance,
    required this.averagePace,
    required this.trackedPositions,
    required this.status,
    this.isDeleted = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RunningSessionApi.fromJson(Map<String, dynamic> json) =>
      _$RunningSessionApiFromJson(json);

  Map<String, dynamic> toJson() => _$RunningSessionApiToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PositionApi {
  final double latitude;
  final double longitude;
  final String timestamp;
  final double accuracy;
  final double altitude;
  final double speed;

  const PositionApi({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    this.accuracy = 0.0,
    this.altitude = 0.0,
    this.speed = 0.0,
  });

  factory PositionApi.fromJson(Map<String, dynamic> json) =>
      _$PositionApiFromJson(json);

  Map<String, dynamic> toJson() => _$PositionApiToJson(this);

  factory PositionApi.fromGeolocator(Position position) => PositionApi(
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: position.timestamp.toIso8601String() ??
            DateTime.now().toIso8601String(),
        accuracy: position.accuracy,
        altitude: position.altitude,
        speed: position.speed,
      );
}
