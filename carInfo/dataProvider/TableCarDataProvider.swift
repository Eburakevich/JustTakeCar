//
//  TableCarDataProvider.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 24.05.22.
//

import Foundation
import UIKit

struct dataProvider {
  
    init(obtainer: InfoCarObtainer, dataModel: CarInfoDataModel) {
        self.obtainer = obtainer
        self.dataModel = dataModel
    }
    
    
    private let obtainer: InfoCarObtainer
    
    private var dataModel: CarInfoDataModel
    
    
    init(obtainer: InfoCarObtainer) {
        self.obtainer = obtainer
        dataModel = self.obtainer.obtainCarsInfo()
    }
    
    func getCars(withIdexPath indexPath: IndexPath) -> CarDataModel {
        return dataModel.allCarInfo[indexPath.section].carInfo[indexPath.row]
    }
    
    var carsCount: Int {
        dataModel.allCarInfo.count
    }
    
    func header(forSection section: Int) -> String {
        dataModel.allCarInfo[section].categoryType
    }
    
    func carsCount(forSection sectionNumber: Int) -> Int {
        dataModel.allCarInfo[sectionNumber].carInfo.count
    }
//
    mutating func removeCar(in section: Int, numbered carNumber: Int) {
        _ = dataModel.allCarInfo[section].carInfo.remove(at: carNumber)
    }
    
    mutating func addCar() {
        dataModel.allCarInfo[2].carInfo.append(.init( car: "Geele Atlas", transmissionType: "automatic transission", priceCategory: "comfort", fuelPercentage: "fuel level 100 %", carImage: UIImage(named: "carImageStandart")!))
                                         }
            
}
            

