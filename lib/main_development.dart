import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ui/core/themes/app_theme.dart';
import 'ui/running/widgets/running_screen.dart';
import 'config/app_config.dart';

void main() {
  // 개발 환경 설정
  // AppConfig.isDevelopment = true;
  // AppConfig.enableLogging = true;

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
      title: '${AppConfig.appName} (Dev)',
      debugShowCheckedModeBanner: true,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const RunningScreen(),
    );
  }
}
