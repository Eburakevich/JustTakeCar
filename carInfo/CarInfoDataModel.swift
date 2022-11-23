//
//  CarInfoDataModel.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 20.05.22.
//

import Foundation
import UIKit

struct CarInfoDataModel {
    var allCarInfo: [CategoryDataModel]
}
struct CategoryDataModel {
   public init(categoryType: String, carInfo: [CarDataModel]) {
        self.categoryType = categoryType
        self.carInfo = carInfo
    }
    
    var categoryType: String
    var carInfo: [CarDataModel]
}
struct CarDataModel {

    let car: String
    let transmissionType: String
    let priceCategory: String
    let fuelPercentage: String
    let carImage: UIImage
    
    init(car: String, transmissionType: String, priceCategory: String, fuelPercentage: String, carImage: UIImage) {
        self.car = car
        self.transmissionType = transmissionType
        self.priceCategory = priceCategory
        self.fuelPercentage = fuelPercentage
        self.carImage = carImage
    }
}

struct ArrayCarDataModel {
    var carsDataModel: [CarDataModel]
}
