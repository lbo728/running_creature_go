import 'package:freezed_annotation/freezed_annotation.dart';

part 'running_session.freezed.dart';
part 'running_session.g.dart';

@freezed
class RunningSession with _$RunningSession {
  const factory RunningSession({
    required String id,
    required DateTime startTime,
    required DateTime? endTime,
    required Duration duration,
    required double distance,
    required double averagePace,
    required List<Position> trackedPositions,
    required RunningStatus status,
    @Default(false) bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RunningSession;

  factory RunningSession.fromJson(Map<String, dynamic> json) =>
      _$RunningSessionFromJson(json);
}

@freezed
class Position with _$Position {
  const factory Position({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
    @Default(0.0) double accuracy,
    @Default(0.0) double altitude,
    @Default(0.0) double speed,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

enum RunningStatus {
  @JsonValue(0)
  notStarted,
  @JsonValue(1)
  running,
  @JsonValue(2)
  paused,
  @JsonValue(3)
  completed,
}
