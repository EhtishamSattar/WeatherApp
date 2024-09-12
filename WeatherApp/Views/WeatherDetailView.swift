import SwiftUI

struct WeatherDetailView: View {
    @ObservedObject var weatherData: WeatherData
    @State private var message: String? = nil
    @State private var showMessageAlert: Bool = false
    
    var body: some View {
        VStack {
            if let cityName = weatherData.weather.city?.name {
                Text(cityName)
                    .font(.title)
                    .padding()
                    .bold()
                
                if let weatherList = weatherData.weather.list {
                    // Make the first item larger
                    if let firstItem = weatherList.first {
                        WeatherDataCard(
                            date: firstItem.dt_txt,
                            temperature: firstItem.main?.temp,
                            weatherDesc: firstItem.weather?.first?.description
                        )
                        .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                    }
                    
                    
                    VStack{
                        Text("Weather in Upcoming Days")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(weatherList.dropFirst(), id: \.dt) { weatherItem in
                                    MiniWeatherCard(
                                        date: weatherItem.dt_txt,
                                        temperature: weatherItem.main?.temp,
                                        weatherDesc: weatherItem.weather?.first?.description
                                    )
                                    .frame(width: 200, height: 230)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.vertical, 40)
                    .alert(isPresented: $showMessageAlert) {
                        Alert(
                            title: Text(message ?? "This app provides weather updates with accuracy and consistency")
                        )
                    }
                    
                }
            } else {
                WeatherUnavailableView(weather_Data: weatherData, message: weatherData.weather.cod , subMessage: (false, "City Not Found"))
                
                
                
            }
            
            Spacer()
        }
        .navigationTitle("Weather Report")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    WeatherDetailView(weatherData: WeatherData())
}
