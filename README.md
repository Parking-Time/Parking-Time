# 주차시간 (Parking Time)
![parking_time](https://github.com/user-attachments/assets/ba4af88b-67f4-4921-9938-d4aa8803d806)

원하는 목적지와 가까운 주차장 또는 제휴를 맺고 있는 주차장의 정보를 찾아주는 앱입니다.

## Must-see code
- Data Layer
  - [service](https://github.com/Parking-Time/Parking-Time/blob/main/lib/data/service/parking_lot_service.dart)
  - [repository impl](https://github.com/Parking-Time/Parking-Time/blob/main/lib/data/repository_impls/parking_lot_repository_impl.dart)
- Domain Layer
  - [entity](https://github.com/Parking-Time/Parking-Time/blob/main/lib/domain/entities/parking_lot/base_parking_lot_entity.dart)
  - [repository](https://github.com/Parking-Time/Parking-Time/blob/main/lib/domain/repositories/parking_lot_repository.dart)
  - [use case](https://github.com/Parking-Time/Parking-Time/blob/main/lib/domain/use_cases/parking_lot_use_case.dart)
- Presentation Layer
  - [provider](https://github.com/Parking-Time/Parking-Time/blob/main/lib/presentation/providers/home/home_provider.dart)
  - [screen](https://github.com/Parking-Time/Parking-Time/blob/main/lib/presentation/ui/home/home_screen.dart)
  - [routing](https://github.com/Parking-Time/Parking-Time/blob/main/lib/presentation/router/app_router.dart)

## Feature
- 주차장
  - 주차장 목록 조회
  - 주차장 상세 조회
  - 주차장 생성
  - 주차장 수정
- 장소
  - 장소 목록 조회
  - 장소 정보 조회
  - 장소 생성
  - 장소 수정
- 유저
  - 유저 정보 관리
  - 유저별 관심 목록 관리

## Coding Convention (Frontend)
- Common
  - Clean Architecture + MVP 기반으로 작성한다.
  - 가능한 SOLID 원칙을 준수한다.
  - 프로젝트의 규모에 맞게 바운더리 간 정보 교환은 Entity, Model을 허용한다.
![Group 456](https://github.com/user-attachments/assets/707b9242-057c-42bf-9dfd-bee0f8fee35f)

- Layer
  - **Data**는 외부 데이터 소스와 상호작용하는 기능을 담당한다. model, service, repository impl로 구성된다.
  - **Domain**은 Business logic, Business rules을 포함하며, entity에 함수와 데이터의 집합을 캡슐화하는 기능을 담당한다.  
use case, interface repository, entity로 구성된다.
  - **Presentation**은 사용자와 정보를 제공하며, 상호작용하는 기능을 담당한다.
ui, component, provider, resource, router로 구성된다.  
(Presentation은 MVVM 패턴을 준수하며, screen과 provider가 1:1 관계로 구성된다.)

- Class
  - 생성자는 매개변수간 행을 나누고, 끝 부분에는 트레일링 콤마(trailing comma)를 붙인다.  
(단, 매개변수가 하나인 경우에는 무시한다.)
  - 외부 데이터 소스와 상호작용할 경우에는 예외없이 interface를 사용한다.  
(이 규칙에는 Local DB 및 Method Channel 또한 포함한다.)

- Error Handling
  - Dart 및 라이브러리에서 발생하는 에러를 제외한 모든 비즈니스 에러는 CommonExceiption으로 관리한다.
  - 각 Layer에서 일어나는 에러는 절대 Layer간 바운더리를 넘지 않으며,
Layer 내부에서 처리하여 CommonExceiption으로 전달한다.

## Project Structure
```
├── README.md
├── analysis_options.yaml
├── android
│   ├── app
│   │   ├── build.gradle
│   │   ├── google-services.json
│   │   └── src
│   │       ├── debug
│   │       │   └── AndroidManifest.xml
│   │       ├── main
│   │       │   ├── AndroidManifest.xml
│   │       │   ├── java
│   │       │   │   └── io
│   │       │   │       └── flutter
│   │       │   │           └── plugins
│   │       │   │               └── GeneratedPluginRegistrant.java
│   │       │   ├── kotlin
│   │       │   │   └── com
│   │       │   │       └── parkingtime
│   │       │   │           └── parking_time
│   │       │   │               └── MainActivity.kt
│   │       │   └── res
│   │       │       └── ...
│   │       └── profile
│   │           └── AndroidManifest.xml
│   ├── build.gradle
│   ├── gradle
│   │   └── wrapper
│   │       └── ...
│   └── settings.gradle
├── assets
│   ├── icons
│   │   └── ...
│   └── images
│       └── ...
├── ios
│   ├── Flutter
│   │   └── ...
│   ├── Podfile
│   ├── Pods
│   │   └── ...
│   ├── Runner
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   └── LaunchImage.imageset
│   │   │       └── ...
│   │   ├── Base.lproj
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   └── ...
│   ├── Runner.xcodeproj
│   │   ├── project.pbxproj
│   │   ├── project.xcworkspace
│   │   │   └── ...
│   │   └── xcshareddata
│   │       └── ...
│   ├── Runner.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   └── xcshareddata
│   │       └── ...
│   ├── RunnerTests
│   │   └── RunnerTests.swift
│   └── firebase_app_id_file.json
├── lib
│   ├── app.dart
│   ├── data
│   │   ├── models
│   │   │   └── ...
│   │   ├── repository_impls
│   │   │   └── ...
│   │   └── service
│   │       ├── dio
│   │       │   └── dio_config.dart
│   │       └── ...
│   ├── domain
│   │   ├── entities
│   │   │   └── ...
│   │   ├── repositories
│   │   │   └── ...
│   │   └── use_cases
│   │       └── ...
│   ├── firebase_options.dart
│   ├── main.dart
│   ├── presentation
│   │   ├── components
│   │   │   ├── card
│   │   │   │   └── ...
│   │   │   ├── chip
│   │   │   │   └── ...
│   │   │   ├── common
│   │   │   │   └── ...
│   │   │   └── text_field
│   │   │       └── ...
│   │   ├── providers
│   │   │   ├── admin
│   │   │   │   └── ...
│   │   │   └── home
│   │   │       └── ...
│   │   ├── resources
│   │   │   ├── ...
│   │   │   └── styles
│   │   │       └── ...
│   │   ├── router
│   │   │   ├── ...
│   │   │   ├── route_animations
│   │   │   │   └── ...
│   │   │   └── routes
│   │   │       ├── ...
│   │   │       ├── screen_routes
│   │   │       │   └── ...
│   │   │       └── tab_routes
│   │   │           └── ...
│   │   └── ui
│   │       └── ...
│   └── utils
│       ├── env
│       │   └── ...
│       ├── extensions
│       │   └── ...
│       ├── sortings
│       │   └── ...
│       ├── typedef
│       │   └── ...
│       └── wrapper.dart
├── pubspec.lock
├── pubspec.yaml
├── test
└── web
    ├── ...
    ├── icons
    │   └── ...
    ├── index.html
    └── manifest.json
```

## Reference
- [Effective Dart](https://dart.dev/effective-dart)
- [Clean Architecture](https://medium.com/@yamen.abd98/clean-architecture-in-flutter-mvvm-bloc-dio-79b1615530e1)

## External API
- Firebase Cloud Functions

## Library & Framework
- Flutter 3.22.2
- Dart 3.4.3
- Flutter Riverpod 2.5.1
- GoRouter 13.2.1
- Retrofit 4.1.0
- Envied 0.5.4+1
- Firebase Core 2.32.0
- Cloud Firestore 4.4.4

## Design
[Figma link](https://www.figma.com/design/aVBhhk26zKm7GL0tu0IZC2/Application%2FWeb-design?m=auto&t=wtjwha5pDRuBkrCT-1)
![parking-time-design](https://github.com/user-attachments/assets/e1917bc2-ed21-49f0-86a8-efd7c9362a42)
