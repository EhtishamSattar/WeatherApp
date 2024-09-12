//
//  Weather.swift
//  WeatherApp
//
//  Created by Mac on 19/08/2024.
//

import Foundation
import Combine

class WeatherData : ObservableObject {
    let apiKey = "b27bd1df9ca7f888b4a5a72d5c43239a"
    @Published var weather: WeatherResponse = WeatherResponse()
    
    //This indicates that the subject will never emit a failure, meaning it will only emit successful values (String in this case) and never terminate with an error.

    let passthrough = PassthroughSubject<(Bool , String), Never>()
    
    func getCityWeather(cityName: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network request error: \(error)")
                self.giveCityMessage(message: "Network request error: \(error)", isSuccess: false)
              
                return
            }

            print("***", data!)
            if let data = data {
                do {
                    let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    self.weather = weatherResponse
                    print("-->",weatherResponse)
                    self.giveCityMessage(message: "Weather details fetched", isSuccess: true)
                   
                    
                } catch {
                    print("JSON decoding error: \(error)")
                    self.giveCityMessage(message: "JSON decoding error: \(error)", isSuccess: false)
                   
                }
            }
        }.resume()
    }
    


//    func getCityWeather(cityName: String , completion: @escaping (Bool) -> Void) {
//        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)"
//        
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Network request error: \(error)")
//                self.giveCityMessage(message: "Network request error: \(error)", isSuccess: false)
//                completion(false)
//                return
//            }
//
//            if let data = data {
//                do {
//                    let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
//                    self.weather = weatherResponse
//                    self.giveCityMessage(message: "Weather details fetched", isSuccess: true)
//                    completion(true)
//                    
//                } catch {
//                    print("JSON decoding error: \(error)")
//                    self.giveCityMessage(message: "JSON decoding error: \(error)", isSuccess: false)
//                    completion(false)
//                }
//            }
//        }.resume()
//    }
    
    func giveCityMessage(message: String , isSuccess : Bool){
        passthrough.send((isSuccess , message))
    }
}
