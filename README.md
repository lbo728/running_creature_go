# 러닝크리쳐 go 🏃‍♂️🐾

러닝 데이터를 기반으로 크리쳐를 생성하고 키우는 감성 러닝 앱입니다.

## ✨ 주요 기능

- **GPS 기반 러닝 추적**: 실시간 위치 추적 및 경로 기록
- **음성 안내**: 킬로미터 단위로 페이스와 시간 안내
- **크리쳐 생성**: LLM API를 활용한 러닝 경로 기반 크리쳐 생성
- **크리쳐 정원**: 수집한 크리쳐들을 관리하고 성장시키는 시스템

## 🚀 시작하기

### 필수 요구사항

- Flutter 3.5.4 이상
- Dart 3.0 이상
- Android Studio / VS Code
- Google Maps API 키

### 1. 프로젝트 클론

```bash
git clone [repository-url]
cd running_creature_go
```

### 2. 의존성 설치

```bash
flutter pub get
```

### 3. Google Maps API 키 설정

#### Android

`android/app/src/main/AndroidManifest.xml` 파일에서:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY" />
```

#### iOS

`ios/Runner/AppDelegate.swift` 파일에서:

```swift
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

### 4. 앱 실행

```bash
flutter run
```

## 📱 사용법

### 러닝 시작

1. 앱을 실행하고 "러닝 시작" 버튼을 탭
2. 위치 권한 허용
3. 러닝 시작!

### 러닝 중

- 실시간으로 거리, 시간, 페이스가 표시됩니다
- 1km마다 음성으로 현재 상태를 안내받습니다
- 지도에 러닝 경로가 실시간으로 그려집니다

### 러닝 종료

1. "종료" 버튼을 탭하여 러닝을 마칩니다
2. 러닝 요약을 확인합니다
3. "크리쳐 생성"을 탭하여 새로운 크리쳐를 만듭니다

## 🛠️ 기술 스택

- **프론트엔드**: Flutter
- **상태 관리**: Riverpod
- **위치 서비스**: Geolocator, Google Maps
- **음성 안내**: Flutter TTS
- **AI 서비스**: OpenAI GPT-4o, DALL·E (준비 중)

## 📋 권한 요구사항

- **위치 권한**: 러닝 경로 추적을 위해 필요
- **인터넷 권한**: 크리쳐 생성 및 API 통신을 위해 필요

## 🔧 개발 환경 설정

### 코드 생성

Freezed 및 Riverpod 코드 생성을 위해:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 린트 체크

```bash
flutter analyze
```

### 테스트 실행

```bash
flutter test
```

## 📁 프로젝트 구조

```
lib/
├── main.dart              # 메인 앱 및 러닝 스크린
├── models/                # 데이터 모델 (준비 중)
├── providers/             # Riverpod 프로바이더 (준비 중)
├── screens/               # 화면 위젯 (준비 중)
└── services/              # API 서비스 (준비 중)
```

## 🎯 향후 계획

- [ ] 크리쳐 정원 화면 구현
- [ ] LLM API 연동 및 크리쳐 생성
- [ ] 사용자 인증 시스템
- [ ] 러닝 기록 저장 및 관리
- [ ] 크리쳐 성장 시스템

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

## 📞 문의

프로젝트에 대한 문의사항이 있으시면 이슈를 생성해 주세요.

---

**러닝크리쳐 go**와 함께 즐거운 러닝을 시작하세요! 🏃‍♂️✨
