import SwiftUI

struct MiniWeatherCard: View {
    var date: String? = ""
    var temperature: Double? = 0.0
    var weatherDesc: String? = ""
    
    var body: some View {
        VStack(alignment: .center) {
            // Weather description
            Text(weatherDesc?.capitalized ?? "No Data")
                .font(.subheadline)
                .bold()
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(Color.black.opacity(0.8))
                .foregroundColor(Color.white)
                .cornerRadius(8)

            Spacer()

            // Temperature
            Text("\((temperature ?? 0) - 273.15, specifier: "%.2f") °C")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)

            Spacer()
            
            // Date
            Text("\(String(describing: date!))")
                .font(.footnote)
                .bold()
                .frame(maxWidth: .infinity, minHeight: 30)
                .background(Color.black.opacity(0.8))
                .foregroundColor(Color.white)
                .cornerRadius(8)
        }
        .frame(width: 200, height: 230)
        .padding(8)
        .background(
            getImageForWeatherDescription(weatherDesc: weatherDesc)
                .resizable()
                .scaledToFill()
        )
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    func getImageForWeatherDescription(weatherDesc: String?) -> Image {
        guard let weatherDesc = weatherDesc?.lowercased() else {
            return Image("defaultImage") // Fallback image
        }
        if weatherDesc.contains("cloud") {
            return Image("cloud")
        } else if weatherDesc.contains("sky") {
            return Image("sky")
        } else {
            return Image("rain")
        }
    }
}

#Preview {
    MiniWeatherCard()
}
