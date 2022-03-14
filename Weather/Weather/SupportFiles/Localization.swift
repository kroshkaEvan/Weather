//
//  Localization.swift
//  Weather
//
//  Created by Эван Крошкин on 14.03.22.
//

import SwiftUI

extension String {
    func localizated() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localization",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
