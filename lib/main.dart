import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

void main() {
  runApp(
    const ProviderScope(
      child: RunningCreatureGoApp(),
    ),
  );
}

class RunningCreatureGoApp extends StatelessWidget {
  const RunningCreatureGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '러닝크리쳐 go',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Pretendard',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF388E3C),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF424242),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  bool _isRunning = false;
  bool _isPaused = false;
  Duration _elapsedTime = Duration.zero;
  double _distance = 0.0;
  double _averagePace = 0.0;
  Timer? _timer;
  List<Position> _trackedPositions = [];
  final FlutterTts _flutterTts = FlutterTts();
  // GoogleMapController? _mapController;
  // Set<Marker> _markers = {};
  // Set<Polyline> _polylines = {};

  // 마지막으로 음성 안내한 킬로미터
  int _lastAnnouncedKm = 0;

  @override
  void initState() {
    super.initState();
    _initializeTts();
    _checkLocationPermission();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _initializeTts() async {
    await _flutterTts.setLanguage("ko-KR");
    await _flutterTts.setSpeechRate(0.8);
    await _flutterTts.setVolume(1.0);
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showLocationPermissionDialog();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showLocationPermissionDialog();
      return;
    }
  }

  void _showLocationPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('위치 권한 필요'),
        content: const Text('러닝 기록을 위해 위치 권한이 필요합니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  void _startRunning() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _isRunning = true;
        _isPaused = false;
        _trackedPositions = [position];
        // _markers = {
        //   Marker(
        //     markerId: const MarkerId('start'),
        //     position: LatLng(position.latitude, position.longitude),
        //     infoWindow: const InfoWindow(title: '시작점'),
        //     icon: BitmapDescriptor.defaultMarkerWithHue(
        //         BitmapDescriptor.hueGreen),
        //   ),
        // };
      });

      _startTimer();
      _startLocationTracking();

      // 시작 음성 안내
      await _flutterTts.speak("러닝을 시작합니다. 즐거운 달리기 되세요!");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('위치를 가져올 수 없습니다: $e')),
      );
    }
  }

  void _pauseRunning() {
    setState(() {
      _isPaused = true;
    });
    _timer?.cancel();
  }

  void _resumeRunning() {
    setState(() {
      _isPaused = false;
    });
    _startTimer();
    _startLocationTracking();
  }

  void _stopRunning() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _isPaused = false;
    });

    _showRunningSummary();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime += const Duration(seconds: 1);
        if (_distance > 0) {
          _averagePace = _elapsedTime.inSeconds / _distance;
        }
      });
    });
  }

  void _startLocationTracking() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // 10미터마다 위치 업데이트
      ),
    ).listen((Position position) {
      if (_isRunning && !_isPaused) {
        setState(() {
          _trackedPositions.add(position);

          // 거리 계산
          if (_trackedPositions.length > 1) {
            _distance += Geolocator.distanceBetween(
                  _trackedPositions[_trackedPositions.length - 2].latitude,
                  _trackedPositions[_trackedPositions.length - 2].longitude,
                  position.latitude,
                  position.longitude,
                ) /
                1000; // 미터를 킬로미터로 변환
          }

          // 경로 그리기
          // _updateMapPath();

          // 킬로미터 단위 음성 안내
          _checkAndAnnounceKilometer();
        });
      }
    });
  }

  // void _updateMapPath() {
  //   if (_trackedPositions.length < 2) return;

  //   List<LatLng> points = _trackedPositions
  //       .map((pos) => LatLng(pos.latitude, pos.longitude))
  //       .toList();

  //   setState(() {
  //     _polylines = {
  //       Polyline(
  //         polylineId: const PolylineId('running_path'),
  //         points: points,
  //         color: Colors.blue,
  //         width: 4,
  //       ),
  //     };
  //   });
  // }

  void _checkAndAnnounceKilometer() {
    int currentKm = _distance.floor();
    if (currentKm > _lastAnnouncedKm && currentKm > 0) {
      _lastAnnouncedKm = currentKm;
      _announceKilometer(currentKm);
    }
  }

  void _announceKilometer(int kilometer) {
    String timeText = _formatDuration(_elapsedTime);
    String paceText = _formatPace(_averagePace);

    String announcement = "$kilometer킬로미터, $timeText, 키로 당 $paceText 페이스입니다.";

    _flutterTts.speak(announcement);
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

  void _showRunningSummary() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('러닝 완료! 🎉'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('총 거리: ${_distance.toStringAsFixed(2)}km'),
            Text('총 시간: ${_formatDuration(_elapsedTime)}'),
            Text('평균 페이스: ${_formatPace(_averagePace)}'),
            const SizedBox(height: 16),
            const Text('이제 크리쳐를 생성할까요?',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetRunning();
            },
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _generateCreature();
            },
            child: const Text('크리쳐 생성'),
          ),
        ],
      ),
    );
  }

  void _resetRunning() {
    setState(() {
      _elapsedTime = Duration.zero;
      _distance = 0.0;
      _averagePace = 0.0;
      _trackedPositions.clear();
      // _markers.clear();
      // _polylines.clear();
      _lastAnnouncedKm = 0;
    });
  }

  void _generateCreature() {
    // TODO: LLM API 호출하여 크리쳐 생성
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('크리쳐 생성 기능은 준비 중입니다! 🐾')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildMapSection(),
            ),
            _buildRunningControls(),
            _buildRunningStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.directions_run,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: 12),
          Text(
            '러닝크리쳐 go',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              // TODO: 정원 화면으로 이동
            },
            icon: const Icon(Icons.eco, color: Colors.white),
            tooltip: '크리쳐 정원',
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    if (_trackedPositions.isEmpty) {
      return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.map,
                size: 64,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                '러닝을 시작하면\n경로가 여기에 표시됩니다',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(12),
      //       child: GoogleMap(
      //     initialCameraPosition: CameraPosition(
      //       target: LatLng(
      //         _trackedPositions.first.latitude,
      //         _trackedPositions.first.longitude,
      //       ),
      //       zoom: 15,
      //     ),
      //     onMapCreated: (controller) => _mapController = controller,
      //     markers: _markers,
      //     polylines: _polylines,
      //     myLocationEnabled: true,
      //     myLocationButtonEnabled: true,
      //     zoomControlsEnabled: false,
      //   ),
      // ),
    );
  }

  Widget _buildRunningControls() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (!_isRunning) ...[
            _buildStartButton(),
          ] else ...[
            if (_isPaused) ...[
              _buildResumeButton(),
              _buildStopButton(),
            ] else ...[
              _buildPauseButton(),
              _buildStopButton(),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return ElevatedButton(
      onPressed: _startRunning,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow, size: 24),
          SizedBox(width: 8),
          Text('러닝 시작', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildPauseButton() {
    return ElevatedButton(
      onPressed: _pauseRunning,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.pause, size: 24),
          SizedBox(width: 8),
          Text('일시정지', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildResumeButton() {
    return ElevatedButton(
      onPressed: _resumeRunning,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow, size: 24),
          SizedBox(width: 8),
          Text('계속하기', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildStopButton() {
    return ElevatedButton(
      onPressed: _stopRunning,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.stop, size: 24),
          SizedBox(width: 8),
          Text('종료', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildRunningStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard(
                icon: Icons.timer,
                title: '경과 시간',
                value: _formatDuration(_elapsedTime),
                color: Colors.blue,
              ),
              _buildStatCard(
                icon: Icons.straighten,
                title: '거리',
                value: '${_distance.toStringAsFixed(2)}km',
                color: Colors.green,
              ),
              _buildStatCard(
                icon: Icons.speed,
                title: '평균 페이스',
                value: _formatPace(_averagePace),
                color: Colors.orange,
              ),
            ],
          ),
          if (_isRunning && !_isPaused) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '러닝 중... 🏃‍♂️',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
