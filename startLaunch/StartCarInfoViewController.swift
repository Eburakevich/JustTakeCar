//
//  CarInfoViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 21.05.22.
//

import UIKit

final class StartCarViewController: UIViewController {
    
   private var userLogin: UserLogin?
    let startView = StartCarView()
    
    func navigationBarSettings() {
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = .init(title: "", style: .plain, target: .none, action: .none)
        navigationController?.viewControllers.remove(at: .zero)
    }
    override func loadView() {
        super.loadView()
        view = startView
        startView.welcomLabel.text = "Hi, \(DataBase.shared.activeUser?.login ?? "driver")"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBarSettings()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) {
//            let backendDataModel = [BackendCarCategoryModel(
//                            category: "Cars Nearby",
//                            carsInfo: [
//                                BackendCarInfoModel(
//                                    carName: "BMW 7-series",
//                                    transmissionType: "automatic transmission",
//                                    priceCategory: "comfort",
//                                    fuelLevel: 67,
//                                    carImage: UIImage(named: "carImageStandart")!),
//                            ]),
//                        BackendCarCategoryModel(
//                            category: "Popular cars",
//                            carsInfo: [
//                                BackendCarInfoModel(
//                                    carName: "VW Polo",
//                                    transmissionType: "manual transmission",
//                                    priceCategory: "econom",
//                                    fuelLevel: 100,
//                                    carImage: UIImage(named: "carImageStandart")!),
//
//                                BackendCarInfoModel(
//                                    carName: "Tesla Model s",
//                                    transmissionType: "automatic transmission",
//                                    priceCategory: "premium",
//                                    fuelLevel: 100,
//                                    carImage: UIImage(named: "carImageStandart"
//                                                     )!),
//                            ]),
//                                    BackendCarCategoryModel(
//                                        category: "BEST CAR ALL TIME",
//                                        carsInfo: [
//                                            BackendCarInfoModel(
//                                                carName: "VW Golf lV TDI 2.0",
//                                                transmissionType: "manual transmission",
//                                                priceCategory: "premium VIP",
//                                                fuelLevel: 100,
//                                                carImage: UIImage(named: "carImageStandart")!)
//                                        ])
//
//            ]
//                    let dataStorage = CarInfoStorage(carInfoModels: backendDataModel)
//                    let obtainer = InfoCarObtainer(dataStorage: dataStorage)
//                    let cardataProvider = dataProvider(obtainer: obtainer)
            self.navigationItem.leftBarButtonItem?.isEnabled = false
            self.navigationController?.pushViewController(TabBarVC(), animated: true)
//            self.navigationController?.pushViewController(CarInfoTableViewController(dataProvider: cardataProvider), animated: true)
            self.navigationController?.viewControllers.remove(at: .zero)
        }
    }
}

