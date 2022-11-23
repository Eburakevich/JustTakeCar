//
//  Extension + String.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 22.11.22.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
        comment: self)
    }
}
