//
//  obtainer.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 23.05.22.
//

import Foundation

struct InfoCarObtainer {
    
    init(dataStorage: CarInfoStorage) {
        self.dataStorage = dataStorage
    }
    
    private let dataStorage: CarInfoStorage
    
    func obtainCarsInfo() -> CarInfoDataModel {
        var categoryCar: [CategoryDataModel] = []
        
        for carInfoModel in dataStorage.carInfoModels {
            let model = CategoryDataModel(
                categoryType: carInfoModel.category,
                carInfo: carInfoModel.carsInfo.compactMap { transform(backendcarsInfo: $0 )}
            )
            categoryCar.append(model)
        }
        return CarInfoDataModel(allCarInfo: categoryCar)
        
    }
    private func transform(backendcarsInfo: BackendCarInfoModel) -> CarDataModel {
            CarDataModel(
            car: backendcarsInfo.carName,
            transmissionType: backendcarsInfo.transmissionType,
            priceCategory: backendcarsInfo.priceCategory,
            fuelPercentage: "fuel \(backendcarsInfo.fuelLevel) % ",
            carImage: backendcarsInfo.carImage )
    }
    
}
