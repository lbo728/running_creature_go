import 'package:geolocator/geolocator.dart' as geo;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/repositories/running_session_repository.dart';
import '../../../data/services/tts_service.dart';
import '../../../domain/models/running_session.dart';
import 'dart:async';

part 'running_view_model.g.dart';

@riverpod
class RunningViewModel extends _$RunningViewModel {
  late final RunningSessionRepository _repository;
  late final TtsService _ttsService;
  Timer? _timer;
  StreamSubscription<geo.Position>? _locationSubscription;
  int _lastAnnouncedKm = 0;

  @override
  Future<RunningSession?> build() async {
    _repository = RunningSessionRepository();
    _ttsService = TtsService();
    await _ttsService.initialize();
    await _checkLocationPermission();
    return null; // 초기 상태는 null
  }

  Future<void> _checkLocationPermission() async {
    geo.LocationPermission permission =
        await _repository.checkLocationPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await _repository.requestLocationPermission();
      if (permission == geo.LocationPermission.denied) {
        state = AsyncValue.error(
          '위치 권한이 거부되었습니다.',
          StackTrace.current,
        );
        return;
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      state = AsyncValue.error(
        '위치 권한이 영구적으로 거부되었습니다.',
        StackTrace.current,
      );
      return;
    }
  }

  Future<void> startRunning() async {
    try {
      final position = await _repository.getCurrentPosition();

      final session = RunningSession(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        startTime: DateTime.now(),
        endTime: null,
        duration: Duration.zero,
        distance: 0.0,
        averagePace: 0.0,
        trackedPositions: [
          Position(
            latitude: position.latitude,
            longitude: position.longitude,
            timestamp: DateTime.now(),
            accuracy: position.accuracy,
            altitude: position.altitude,
            speed: position.speed,
          )
        ],
        status: RunningStatus.running,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      _startTimer();
      _startLocationTracking();
      await _ttsService.speak("러닝을 시작합니다. 즐거운 달리기 되세요!");

      state = AsyncValue.data(session);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void pauseRunning() {
    final currentSession = state.valueOrNull;
    if (currentSession != null) {
      final updatedSession = currentSession.copyWith(
        status: RunningStatus.paused,
      );
      state = AsyncValue.data(updatedSession);
      _timer?.cancel();
    }
  }

  void resumeRunning() {
    final currentSession = state.valueOrNull;
    if (currentSession != null) {
      final updatedSession = currentSession.copyWith(
        status: RunningStatus.running,
      );
      state = AsyncValue.data(updatedSession);
      _startTimer();
      _startLocationTracking();
    }
  }

  Future<void> stopRunning() async {
    _timer?.cancel();
    _locationSubscription?.cancel();

    final currentSession = state.valueOrNull;
    if (currentSession != null) {
      final updatedSession = currentSession.copyWith(
        endTime: DateTime.now(),
        status: RunningStatus.completed,
      );
      state = AsyncValue.data(updatedSession);

      // TODO: 세션 저장 로직
      // await _repository.saveRunningSession(updatedSession);
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentSession = state.valueOrNull;
      if (currentSession != null &&
          currentSession.status == RunningStatus.running) {
        final updatedSession = currentSession.copyWith(
          duration: currentSession.duration + const Duration(seconds: 1),
        );
        state = AsyncValue.data(updatedSession);
      }
    });
  }

  void _startLocationTracking() {
    _locationSubscription?.cancel(); // 기존 구독이 있다면 취소
    _locationSubscription =
        _repository.getPositionStream().listen((geo.Position position) {
      final currentSession = state.valueOrNull;
      if (currentSession != null &&
          currentSession.status == RunningStatus.running) {
        final newPosition = Position(
          latitude: position.latitude,
          longitude: position.longitude,
          timestamp: DateTime.now(),
          accuracy: position.accuracy,
          altitude: position.altitude,
          speed: position.speed,
        );

        final updatedPositions = [
          ...currentSession.trackedPositions,
          newPosition
        ];
        double newDistance = currentSession.distance;

        if (updatedPositions.length > 1) {
          final lastPosition = updatedPositions[updatedPositions.length - 2];
          final distanceInMeters = _repository.calculateDistance(
            lastPosition.latitude,
            lastPosition.longitude,
            newPosition.latitude,
            newPosition.longitude,
          );
          newDistance += distanceInMeters / 1000; // 미터를 킬로미터로 변환
        }

        final updatedSession = currentSession.copyWith(
          trackedPositions: updatedPositions,
          distance: newDistance,
        );

        state = AsyncValue.data(updatedSession);
        _checkAndAnnounceKilometer(newDistance);
      }
    });
  }

  void _checkAndAnnounceKilometer(double distance) {
    int currentKm = distance.floor();
    if (currentKm > _lastAnnouncedKm && currentKm > 0) {
      _lastAnnouncedKm = currentKm;
      _announceKilometer(currentKm);
    }
  }

  void _announceKilometer(int kilometer) {
    final currentSession = state.valueOrNull;
    if (currentSession != null) {
      final timeText = _formatDuration(currentSession.duration);
      final paceText = _formatPace(currentSession.averagePace);
      final announcement = "$kilometer킬로미터, $timeText, 키로 당 $paceText 페이스입니다.";
      _ttsService.speak(announcement);
    }
  }

  String _formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return "$minutes분 $seconds초";
  }

  String _formatPace(double paceSecondsPerKm) {
    if (paceSecondsPerKm == 0) return "0분 0초";
    int minutes = (paceSecondsPerKm / 60).floor();
    int seconds = (paceSecondsPerKm % 60).round();
    return "$minutes분 $seconds초";
  }

  void resetRunning() {
    _timer?.cancel();
    _locationSubscription?.cancel();
    _lastAnnouncedKm = 0;
    state = const AsyncValue.data(null);
  }

  // Riverpod에서는 dispose가 자동으로 호출되므로 별도 구현 불필요
  // Timer와 StreamSubscription은 build 메서드에서 자동으로 정리됨
}
