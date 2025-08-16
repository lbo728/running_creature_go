# 러닝크리쳐 go

러닝을 통해 크리쳐를 생성하는 Flutter 앱입니다.

## 프로젝트 구조

이 프로젝트는 Flutter의 권장 아키텍처 가이드에 따라 구성되었습니다.

```
lib
├─┬─ ui                          # UI 레이어
│ ├─┬─ core                      # 공통 UI 컴포넌트
│ │ ├─┬─ ui                      # 공유 위젯
│ │ │ ├─── stat_card.dart        # 통계 카드 위젯
│ │ │ └─── running_button.dart   # 러닝 버튼 위젯
│ │ └─── themes                  # 테마 설정
│ │   └─── app_theme.dart        # 앱 테마
│ └─┬─ running                   # 러닝 기능
│   ├─┬─ view_model             # 뷰모델
│   │ └─── running_view_model.dart
│   └─┬─ widgets                # 위젯
│     └─── running_screen.dart  # 러닝 화면
├─┬─ domain                      # 도메인 레이어
│ └─┬─ models                    # 도메인 모델
│   └─── running_session.dart    # 러닝 세션 모델
├─┬─ data                        # 데이터 레이어
│ ├─┬─ repositories              # 리포지토리
│ │ └─── running_session_repository.dart
│ ├─┬─ services                  # 서비스
│ │ ├─── location_service.dart   # 위치 서비스
│ │ └─── tts_service.dart       # TTS 서비스
│ └─┬─ model                     # API 모델
│   └─── running_session_api.dart
├─── config                      # 설정
│ └─── app_config.dart
├─── utils                       # 유틸리티
│ └─── format_utils.dart
├─── routing                     # 라우팅
│ └─── app_router.dart
├─── main_staging.dart           # 스테이징 환경
├─── main_development.dart       # 개발 환경
└─── main.dart                   # 프로덕션 환경
```

## 아키텍처 패턴

- **MVVM (Model-View-ViewModel)**: UI 레이어에서 사용
- **Repository Pattern**: 데이터 액세스 추상화
- **Service Layer**: 비즈니스 로직 분리
- **Dependency Injection**: Riverpod을 통한 의존성 주입

## 주요 기능

- 🏃‍♂️ 러닝 세션 추적
- 📍 GPS 위치 추적
- 🗣️ TTS 음성 안내
- 📊 실시간 러닝 통계
- 🗺️ 러닝 경로 시각화 (구현 예정)

## 개발 환경 설정

### 필수 의존성

```yaml
dependencies:
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.5
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  geolocator: ^10.1.0
  flutter_tts: ^3.8.5

dev_dependencies:
  build_runner: ^2.4.7
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  riverpod_generator: ^2.3.9
```

### 코드 생성

```bash
# 코드 생성 실행
flutter pub run build_runner build --delete-conflicting-outputs

# 지속적 코드 생성 (개발 중)
flutter pub run build_runner watch
```

## 실행 방법

### 개발 환경

```bash
flutter run -t lib/main_development.dart
```

### 스테이징 환경

```bash
flutter run -t lib/main_staging.dart
```

### 프로덕션 환경

```bash
flutter run -t lib/main.dart
```

## 테스트

```bash
# 단위 테스트
flutter test

# 특정 테스트 파일
flutter test test/domain/models/running_session_test.dart
```

## 라이센스

이 프로젝트는 MIT 라이센스 하에 배포됩니다.
