import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/running_view_model.dart';
import '../../../ui/core/ui/stat_card.dart';
import '../../../ui/core/ui/running_button.dart';
import '../../../domain/models/running_session.dart';

class RunningScreen extends ConsumerWidget {
  const RunningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runningState = ref.watch(runningViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: runningState.when(
          data: (session) => _buildRunningContent(context, ref, session),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => _buildErrorContent(context, ref, error),
        ),
      ),
    );
  }

  Widget _buildRunningContent(
    BuildContext context,
    WidgetRef ref,
    RunningSession? session,
  ) {
    return Column(
      children: [
        _buildHeader(context),
        Expanded(child: _buildMapSection(session)),
        _buildRunningControls(context, ref, session),
        _buildRunningStats(context, session),
      ],
    );
  }

  Widget _buildErrorContent(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          SelectableText.rich(
            TextSpan(
              text: '오류가 발생했습니다: ',
              style: const TextStyle(fontSize: 16),
              children: [
                TextSpan(
                  text: error.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.refresh(runningViewModelProvider),
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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

  Widget _buildMapSection(RunningSession? session) {
    if (session?.trackedPositions.isEmpty ?? true) {
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
      child: const Center(
        child: Text('지도 영역 (Google Maps 구현 예정)'),
      ),
    );
  }

  Widget _buildRunningControls(
    BuildContext context,
    WidgetRef ref,
    RunningSession? session,
  ) {
    final isRunning = session?.status == RunningStatus.running;
    final isPaused = session?.status == RunningStatus.paused;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (!isRunning && !isPaused) ...[
            RunningButton(
              onPressed: () =>
                  ref.read(runningViewModelProvider.notifier).startRunning(),
              text: '러닝 시작',
              icon: Icons.play_arrow,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
          ] else ...[
            if (isPaused) ...[
              RunningButton(
                onPressed: () =>
                    ref.read(runningViewModelProvider.notifier).resumeRunning(),
                text: '계속하기',
                icon: Icons.play_arrow,
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              RunningButton(
                onPressed: () =>
                    ref.read(runningViewModelProvider.notifier).stopRunning(),
                text: '종료',
                icon: Icons.stop,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ] else ...[
              RunningButton(
                onPressed: () =>
                    ref.read(runningViewModelProvider.notifier).pauseRunning(),
                text: '일시정지',
                icon: Icons.pause,
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              RunningButton(
                onPressed: () =>
                    ref.read(runningViewModelProvider.notifier).stopRunning(),
                text: '종료',
                icon: Icons.stop,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildRunningStats(BuildContext context, RunningSession? session) {
    if (session == null) return const SizedBox.shrink();

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
              StatCard(
                icon: Icons.timer,
                title: '경과 시간',
                value: _formatDuration(session.duration),
                color: Colors.blue,
              ),
              StatCard(
                icon: Icons.straighten,
                title: '거리',
                value: '${session.distance.toStringAsFixed(2)}km',
                color: Colors.green,
              ),
              StatCard(
                icon: Icons.speed,
                title: '평균 페이스',
                value: _formatPace(session.averagePace),
                color: Colors.orange,
              ),
            ],
          ),
          if (session.status == RunningStatus.running) ...[
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
}
