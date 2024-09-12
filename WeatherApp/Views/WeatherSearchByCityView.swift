import SwiftUI

struct WeatherSearchByCityView: View {
    @State private var cityName: String = ""
    @State private var navigateToWeatherView: Bool = false
    @StateObject var cityWeatherData : WeatherData = WeatherData()
    @State var showMessageAlert : Bool = false
    @State var message : String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("SkyCast")
                    .bold()
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("SkyCast is your go-to app for accurate and up-to-date weather information. With intuitive and user-friendly design, it provides real-time weather updates, detailed forecasts, and insights into weather patterns. Whether you're planning your day or preparing for a trip, WeatherWise ensures you stay informed and ahead of the elements. Experience the power of clear, concise weather data right at your fingertips.")
                    .lineLimit(4)
                    .frame(maxWidth: 300, maxHeight: 200, alignment: .center)
                
                
                TextField("Enter city name", text: $cityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(20)
                
                NavigationLink(value: cityName) {
                    Button(action: {
                       // navigateToWeatherView = true
                       // DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                          
                       // }
//                        cityWeatherData.getCityWeather(cityName: cityName) { isSuccess in
//                         
//
//                        }
                        
                        cityWeatherData.getCityWeather(cityName: cityName)
                        
                    }) {
                        Text("Search")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(cityName.isEmpty ? Color.gray : Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                    }
                    .disabled(cityName.isEmpty)
                }
                .navigationDestination(isPresented: $navigateToWeatherView) {
                    WeatherDetailView(weatherData: cityWeatherData)
                }
                Spacer()
            }
            .onReceive(cityWeatherData.passthrough) { response in // RECEIVING PASSTHROUG FROM WATHER VIEWMODEL
                if response.0 {
                    navigateToWeatherView = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                        self.showMessageAlert = true
                    }
                    
                }
                else{
                    self.message = response.1
                    self.showMessageAlert = true
                }
            }
            .alert(isPresented: $showMessageAlert) {
                Alert(
                    title: Text(message != "" ? message : "This app provides weather updates with accuracy and consistency")
                )
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    NavigationLink(destination: AppProfileView()) {
                        Image(systemName: "person.fill")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                    }
                }
            }
        }
    }
}


#Preview {
    WeatherSearchByCityView()
}
