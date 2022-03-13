//
//  FullWeatherView.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import SwiftUI

struct FullWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            CurrentlyWeatherView(weatherViewModel: weatherViewModel)
                .padding()
            DailyWeatherView(weatherViewModel: weatherViewModel)
                .padding(.horizontal)
                .padding(.vertical, 15)
        }
    }
}

struct FullWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        FullWeatherView(weatherViewModel: WeatherViewModel())
    }
}