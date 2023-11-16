# WeatherSnap ☀️

- Best Practice 용도로 만든 날씨앱_(RevenueCat활용 → 인앱결제)

## App Screen 🎞️

![1](https://github.com/Woobios97/WeatherSnap/assets/138302237/6b9e53da-828f-48f4-9c8b-8bb127afdbef) | ![2](https://github.com/Woobios97/WeatherSnap/assets/138302237/daee7150-2a3d-4fbd-b13c-ede4db256b7d) | ![3](https://github.com/Woobios97/WeatherSnap/assets/138302237/e7ce3b64-0538-4b67-ad69-16837ccac9dc)


## 아키텍처 🏛️

<img width="1379" alt="스크린샷 2023-11-16 오후 5 34 20" src="https://github.com/Woobios97/WeatherSnap/assets/138302237/91684859-f825-44c0-8f1b-c3f5ea3ec7f0">

<br/>

> 클린아키텍처
> 
- **Presentation Layer**
    
    > 사용자 인터페이스와 관련된 로직을 처리했다. MVVM패턴을 활용했다.
    > 
    - **Controllers 폴더**: **`WeatherViewController.swift`**, **`SettingsViewController.swift`**, **`TabViewController.swift`**
    - **ViewModels 폴더**: **`SettingViewViewModel.swift`**, **`WeatherViewModel.swift`**, **`CurrentWeatherCollectionViewCellViewModel.swift`**, **`HourlyWeatherCollectionViewCellViewModel.swift`**, **`DailyWeatherCollectionViewCellViewModel.swift`**
    - **Views 폴더**: 모든 뷰 관련 파일 (**`CurrentWeatherCollectionViewCell.swift`**, **`HourlyWeatherCollectionViewCell.swift`**, **`DailyWeatherCollectionViewCell.swift`**, **`CurrentWeatherView.swift`**, **`SettingView.swift`** 등)
- **Domain Layer**
    
    > 비즈니스로직과 핵심 기능을 담당하기때문에, WeatherSnap의 현재날씨, 시간별날씨, 날짜별날씨인 UseCase를 작성했다.
    > 
    - **Model폴더: `CurrentWeatherSection.swift`**
- **Data Layer**
    
    > 네트워크 요청이나 데이터베이스 액세스(백엔드 & 로컬)와 관련된 로직을 포함한다.
    > 
    - **Managers 폴더**: **`LocationManager.swift`**, **`IAPManager.swift`**, **`WeatherManager.swift`**
    

## 사용 프레임워크 및 라이브러리 👨🏻‍💻

- **UIKit**
- **RevenueCat**
