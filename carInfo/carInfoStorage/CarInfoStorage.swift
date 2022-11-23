
import Foundation
import UIKit

struct BackendCarInfoModel {
    let carName: String
    let transmissionType: String
    let priceCategory: String
    let fuelLevel: Int
    let carImage: UIImage
}

struct BackendCarCategoryModel {
    let category: String
    private(set) var carsInfo: [BackendCarInfoModel]
}

struct CarInfoStorage {
    private(set) var carInfoModels: [BackendCarCategoryModel]
    
    struct ArrayBackendDataModel {
        let arrayBackens: [BackendCarInfoModel]
    }
}


