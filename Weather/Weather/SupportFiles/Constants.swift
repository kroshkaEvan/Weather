//
//  Constants.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

import UIKit

class Constants {

    // MARK: - Strings

    class Strings {
        static let city = "Minsk"
        static let url = "https://api.openweathermap.org/data/2.5"
    }

    // MARK: - Dimensions

    class Dimensions {
        static let firstSpacing: CGFloat = 5
        static let secondSpacing: CGFloat = 10
        static let defaultPadding: CGFloat = 20
        static let cornerRadius: CGFloat = 20
        static let defaultWidth: CGFloat = 30
        static let defaultHeight: CGFloat = 30
    }

    // MARK: - Colors

    class Colors {
        static let appMainColor = UIColor(red: 58 / 255, green: 124 / 255, blue: 80 / 255, alpha: 1)
    }

    // MARK: - Images

    class Images {
        static let humidity = "humidity"
        static let wind = "wind"
        static let umbrella = "umbrella"
    }
    
    // MARK: - Font

    class Font {
        static let smallSize: CGFloat = 16
        static let mediumSize: CGFloat = 30
        static let largeSize: CGFloat = 45
    }
}
