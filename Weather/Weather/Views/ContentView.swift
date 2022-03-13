//
//  ContentView.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                SearchCityView(weatherViewModel: weatherViewModel)
                ScrollView(showsIndicators: false) {
                    FullWeatherView(weatherViewModel: weatherViewModel)
                        .padding(.top, 10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
