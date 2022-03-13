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
                .padding(.leading, 50)
                .font(.system(size: Constants.Font.mediumSize))
            Button {
                weatherViewModel.city = startCity
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: Constants.Dimensions.cornerRadius)
                        .fill(Color.blue)
                        .frame(width: 60, height: 60)
                    Image(systemName: Constants.Images.magnifyingGlass)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                }
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack (alignment: .leading) {
            Image(systemName: Constants.Images.location)
                .foregroundColor(.white)
                .padding(.leading, Constants.Dimensions.defaultPadding)
            RoundedRectangle(cornerRadius: Constants.Dimensions.cornerRadius)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
