import SwiftUI

struct WeatherUnavailableView: View {
    @ObservedObject var weather_Data : WeatherData
    var message : String?
    @State var subMessage : (Bool, String)?
    var body: some View {
        VStack {
            Spacer()
            if let message = message {
                Text(message.isEmpty ? "Weather Data is Not Available" : message)
                    .font(.title)
                    .padding()
            }
            
            
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
                .padding()
            
            if let subMessage = subMessage {
                Text(subMessage.1.isEmpty ? "Please check your network connection or try again later." : subMessage.1)
                    .font(.body)
                    .padding()
            }
            
            Spacer()
        }
        .navigationTitle("Weather Unavailable")
        .navigationBarTitleDisplayMode(.inline)
//        .onReceive(weather_Data.passthrough, perform: { (success, message) in
//            subMessage?.0 = success
//            subMessage?.1 = message
//        })
    }
}

struct WeatherUnavailableView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherUnavailableView(weather_Data: WeatherData())
    }
}
