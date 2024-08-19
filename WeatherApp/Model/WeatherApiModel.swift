import Foundation

struct WeatherResponse: Codable {
    var cod: String?
    var message: Int?
    var cnt: Int?
    var list: [WeatherList]?
    var city: City?

    // Add a default initializer
    init(cod: String? = nil, message: Int? = nil, cnt: Int? = nil, list: [WeatherList]? = nil, city: City? = nil) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
        self.city = city
    }
}

struct WeatherList: Codable {
    var dt: Int?
    var main: Main?
    var weather: [Weather]?
    var clouds: Clouds?
    var wind: Wind?
    var visibility: Int?
    var pop: Double?
    var rain: Rain?
    var sys: Sys?
    var dt_txt: String?
}

struct Main: Codable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var sea_level: Int?
    var grnd_level: Int?
    var humidity: Int?
    var temp_kf: Double?
}

struct Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Clouds: Codable {
    var all: Int?
}

struct Wind: Codable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
}

struct Rain: Codable {
    var threeH: Double? // JSON key might need to be adjusted
}

struct Sys: Codable {
    var pod: String?
}

struct City: Codable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population: Int?
    var timezone: Int?
    var sunrise: Int?
    var sunset: Int?
}

struct Coord: Codable {
    var lat: Double?
    var lon: Double?
}
