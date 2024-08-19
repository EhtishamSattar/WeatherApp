import SwiftUI

struct WeatherUnavailableView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Weather Data is Not Available")
                .font(.title)
                .padding()
            
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
                .padding()
            
            Text("Please check your network connection or try again later.")
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Weather Unavailable")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WeatherUnavailableView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherUnavailableView()
    }
}
