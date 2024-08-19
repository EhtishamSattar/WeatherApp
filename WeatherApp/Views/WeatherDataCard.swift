//
//  WeatherDataCard.swift
//  WeatherApp
//
//  Created by Mac on 19/08/2024.
//

import SwiftUI

struct WeatherDataCard: View {
    var date : String? = ""
    var temperature : Double? = 0.0
    var weatherDesc : String? = ""
    
    //@State var image : UIImage
    
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(weatherDesc?.capitalized ?? "No Data")
                .font(.headline)
                .bold()
                .frame(width: 250, height: 70)
                .background(Color.black)
                .foregroundColor(Color.white)
                .opacity(0.8)
                .cornerRadius(10)

            Spacer()
            Text("\((temperature ?? 0) - 273.15, specifier: "%.2f") °C")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.white)

            
            Spacer()
            Text("\(String(describing: date!))")
                .font(.headline)
                .bold()
                .frame(width: 250, height: 70)
                .background(Color.black)
                .foregroundColor(Color.white)
                .opacity(0.8)
                .cornerRadius(10)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(
                    getImageForWeatherDescription(weatherDesc: weatherDesc)
                        .resizable()
                        //.aspectRatio(contentMode: .fill)
                )
                .cornerRadius(10)
                .shadow(radius: 5)
    }
    
    func getImageForWeatherDescription(weatherDesc: String?) -> Image {
            guard let weatherDesc = weatherDesc?.lowercased() else {
                return Image("defaultImage") // image if no description is available
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
    WeatherDataCard()
}
