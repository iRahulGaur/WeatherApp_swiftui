//
//  WeatherView.swift
//  Weather
//
//  Created by Rahul Gaur on 28/1/2025.
//

import SwiftUI

struct WeatherView: View {
    @State private var backgroundColor: LinearGradient = WeatherView.getBackgroundColor()
    
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                        .foregroundColor(.white)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        
                        VStack(spacing: 20) {
                            
                            let myIcon: String = weather.weather.first?.icon ?? "01d"
                            Image(systemName: getWeatherIcon(myIcon))
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                            
                            Text(weather.weather[0].main)
                                .foregroundColor(.white)
                        }
                        .frame(width: 100, height: 100, alignment: .leading)
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 350)
                                        } placeholder: {
                                            ProgressView()
                                        }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)

            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }.edgesIgnoringSafeArea(.bottom)
            .background{
                WeatherView.getBackgroundColor()
            }
    }
    
    static func getBackgroundColor() -> LinearGradient {
        let hour = Calendar.current.component(.hour, from: Date())

        print("This is hour = \(hour)")
        
        switch hour {
        case 6..<9:
            return LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow]),
                                  startPoint: .top, endPoint: .bottom)
        case 9..<15:
            return LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]),
                                  startPoint: .top, endPoint: .bottom)
        case 15..<18:
            return LinearGradient(gradient: Gradient(colors: [Color.orange, Color.blue]),
                                  startPoint: .top, endPoint: .bottom)
        case 18..<21:
            return LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]),
                                  startPoint: .top, endPoint: .bottom)
        default:
            return LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]),
                                  startPoint: .top, endPoint: .bottom)
        }
    }
    
    // Function to Convert API Icon to SF Symbol
    func getWeatherIcon(_ icon: String) -> String {
        let iconMapping: [String: String] = [
            "01d": "sun.max.fill",
            "01n": "moon.stars.fill",
            "02d": "cloud.sun.fill",
            "02n": "cloud.moon.fill",
            "03d": "cloud.fill",
            "03n": "cloud.fill",
            "04d": "smoke.fill",
            "04n": "smoke.fill",
            "09d": "cloud.rain.fill",
            "09n": "cloud.rain.fill",
            "10d": "cloud.sun.rain.fill",
            "10n": "cloud.moon.rain.fill",
            "11d": "cloud.bolt.fill",
            "11n": "cloud.bolt.fill",
            "13d": "snowflake",
            "13n": "snowflake",
            "50d": "cloud.fog.fill",
            "50n": "cloud.fog.fill"
        ]

        return iconMapping[icon] ?? "questionmark.circle" // Default icon
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
