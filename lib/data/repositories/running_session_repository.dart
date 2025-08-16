import 'package:geolocator/geolocator.dart';
import '../model/running_session_api.dart';
import '../services/location_service.dart';

class RunningSessionRepository {
  final LocationService _locationService = LocationService();

  Future<Position> getCurrentPosition() async {
    return await _locationService.getCurrentPosition();
  }

  Stream<Position> getPositionStream() {
    return _locationService.getPositionStream();
  }

  Future<LocationPermission> checkLocationPermission() async {
    return await _locationService.checkPermission();
  }

  Future<LocationPermission> requestLocationPermission() async {
    return await _locationService.requestPermission();
  }

  double calculateDistance(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    return _locationService.calculateDistance(
      startLat,
      startLng,
      endLat,
      endLng,
    );
  }

  // TODO: 실제 API 호출 구현
  Future<void> saveRunningSession(RunningSessionApi session) async {
    // API 호출 로직 구현
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<List<RunningSessionApi>> getRunningSessions() async {
    // API 호출 로직 구현
    await Future.delayed(const Duration(milliseconds: 500));
    return [];
  }
}
