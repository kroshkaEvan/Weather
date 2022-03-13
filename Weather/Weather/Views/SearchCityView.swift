//
//  SearchCityView.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import SwiftUI

struct SearchCityView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    @State private var startCity = Constants.Strings.city
    
    var body: some View {
        HStack {
            TextField("", text: $startCity)
                .padding(.leading, 20)
            Button {
                weatherViewModel.city = startCity
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack (alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
