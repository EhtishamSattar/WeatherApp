//
//  Weather.swift
//  WeatherApp
//
//  Created by Mac on 19/08/2024.
//

import Foundation


class WeatherData : ObservableObject {
    let apiKey = "b27bd1df9ca7f888b4a5a72d5c43239a"
    @Published var weather: WeatherResponse = WeatherResponse()


    func getCityWeather(cityName: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network request error: \(error)")
                return
            }

            if let data = data {
                do {
                    let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    self.weather = weatherResponse
                    
                } catch {
                    print("JSON decoding error: \(error)")
                }
            }
        }.resume()
    }
}
