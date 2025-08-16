import 'package:flutter/material.dart';
import '../ui/running/widgets/running_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String running = '/running';
  static const String garden = '/garden';
  static const String settings = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == home || settings.name == running) {
      return MaterialPageRoute(
        builder: (_) => const RunningScreen(),
      );
    } else if (settings.name == garden) {
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('크리쳐 정원 (구현 예정)')),
        ),
      );
    } else if (settings.name == settings) {
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('설정 (구현 예정)')),
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('페이지를 찾을 수 없습니다')),
        ),
      );
    }
  }
}
