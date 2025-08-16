class AppConfig {
  static const String appName = '러닝크리쳐 go';
  static const String appVersion = '1.0.0';

  // 위치 서비스 설정
  static const int locationUpdateInterval = 1000; // 1초
  static const double locationAccuracy = 10.0; // 10미터

  // TTS 설정
  static const String ttsLanguage = 'ko-KR';
  static const double ttsSpeechRate = 0.8;
  static const double ttsVolume = 1.0;

  // 러닝 설정
  static const int kilometerAnnouncementInterval = 1000; // 1킬로미터마다

  // API 설정
  static const String baseUrl = 'https://api.runningcreature.com';
  static const int apiTimeout = 30000; // 30초

  // 개발 환경 설정
  static const bool isDevelopment = true;
  static const bool enableLogging = true;
}
