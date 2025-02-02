# ☁️ WeatherApp SwiftUI
*A Weather App built using SwiftUI*

## 📌 Overview
WeatherApp SwiftUI is a simple yet elegant weather application built using **SwiftUI**. It fetches real-time weather data based on the user's location and provides a visually appealing weather forecast experience.

## 🛠 Tech Stack
- **Swift** 🌟
- **SwiftUI** 📱
- **CoreLocation** 📏 (for fetching user location)
- **Combine** 🌐 (for async data handling)
- **OpenWeather API** 🌬 (for fetching weather data)

## ✨ Features
- 🌍 **Fetches user's location to display weather data**
- 🌡 **Displays current temperature, min/max temperature**
- 🌬 **Shows wind speed and humidity levels**
- 🌄 **Dynamic background changes based on weather conditions**
- ⏰ **Displays local time and location**
- ☁ **Weather icons update dynamically**

## 📸 Screenshots
Screenshots contain dummy data, so ignore temperature values over 200°.

![screenshot](Screenshots/screenshot1.png)

![screenshot](Screenshots/screenshot2.png)

## 📦 Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/iRahulGaur/WeatherApp_swiftui.git
   ```
2. **Open the project in Xcode** (Latest version recommended)
3. **Get a free API key** from [OpenWeather](https://openweathermap.org/api)
4. **Add API Key** in `Constants.swift`
5. **Run the app** on a simulator or a physical device

## 🏰 Architecture
This app follows the **MVVM (Model-View-ViewModel)** architecture:
- **Model**: Handles data structure and API responses
- **ViewModel**: Manages UI-related data and logic
- **SwiftUI Views**: Displays dynamic UI based on data

## 🔥 Future Improvements
- 🌎 Support for multiple cities
- 📊 Hourly & weekly weather forecast
- 🌃 Dark mode theme
- 📍 Widget support for quick weather updates

## 🤝 Contributing
Contributions are welcome! Feel free to fork the repo, create a branch, and submit a pull request.

## 🐝 License
This project is **MIT Licensed**. Feel free to use and modify it as per your needs.

---

Enjoy coding! 🚀
