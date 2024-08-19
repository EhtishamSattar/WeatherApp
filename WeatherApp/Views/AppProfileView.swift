//
//  AppProfileView.swift
//  WeatherApp
//
//  Created by Mac on 19/08/2024.
//

import SwiftUI

import SwiftUI

struct AppProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            Text("Welcome to WeatherApp!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text("WeatherApp provides real-time weather information and forecasts for any city. Simply enter the name of a city, and you’ll get detailed weather data including temperature, conditions, and more.")
                .font(.body)
                .padding(.bottom, 10)
            
            Text("Features:")
                .font(.headline)
                .padding(.bottom, 5)
            
            Text("• Search for weather by city name\n• View detailed forecasts with temperature and conditions\n• Enjoy a clean, user-friendly interface with interactive weather cards")
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle("How It Works")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AppProfileView()
}
