import SwiftUI

struct WeatherDetailView: View {
    @ObservedObject var weatherData: WeatherData
    
    var body: some View {
        VStack {
            
            if let cityName = weatherData.weather.city?.name {
                Text("\(cityName)")
                    .font(.title)
                    .padding()
                    .bold()
                
                // Displaying actual weather data
                
                if let weatherList = weatherData.weather.list {
                    ScrollView(.horizontal , showsIndicators: true) {
                        HStack{
                            ForEach(weatherList, id: \.dt) { weatherItem in
                                
                                // this is an array of a single object thats why we are using .first
                                WeatherDataCard(date: weatherItem.dt_txt, temperature: weatherItem.main?.temp, weatherDesc: weatherItem.weather?.first?.description)
                                    .frame(width: UIScreen.main.bounds.width - 40)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        
                    }
                    
                }
                
            } else {
                WeatherUnavailableView()
            }
            
            Spacer()
        }
        .navigationTitle("Weather Report")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    WeatherDetailView(
        weatherData: WeatherData()
    )
}
