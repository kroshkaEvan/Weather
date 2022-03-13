//
//  CurrentlyWeatherView.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import SwiftUI

struct CurrentlyWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Today")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack(spacing: 20) {
                CustomAnimationView(name: weatherViewModel.getLottieAnimationFor(icon: weatherViewModel.weatherIcon))
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text("\(weatherViewModel.temperature)°C")
                        .font(.system(size: 42))
                    Text(weatherViewModel.conditions)
                }
            }
            HStack {
                Spacer()
                WidgetView(image: "wind", color: .green, title: "\(weatherViewModel.windSpeed) m/s")
                Spacer()
                WidgetView(image: "drop.fill", color: .blue, title: "\(weatherViewModel.humidity)")
                Spacer()
                WidgetView(image: "umbrella.fill", color: .red, title: "\(weatherViewModel.rainChances)")
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(.white)
    }
    
    private func WidgetView (image: String,
                             color: Color,
                             title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundStyle(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            Text(title)
                .font(.title)
        }
    }
}

struct CurrentlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentlyWeatherView(weatherViewModel: WeatherViewModel())
    }
}
