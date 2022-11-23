//
//  TabBarVC.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 15.09.22.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true 
        generateTabBar()
        setTabBar()
       
    }
    private func generateTabBar() {
        let backendDataModel = [BackendCarCategoryModel(
            category: "Recommedations".localized(),
                                   carsInfo: [
                                       BackendCarInfoModel(
                                           carName: "BMW 7-series",
                                           transmissionType: "automatic transmission",
                                           priceCategory: "comfort",
                                           fuelLevel: 67,
                                           carImage: UIImage(named: "carImageStandart")!),
                                       BackendCarInfoModel(
                                           carName: "VV PASSAT",
                                           transmissionType: "automatic transmission",
                                           priceCategory: "comfort",
                                           fuelLevel: 67,
                                           carImage: UIImage(named: "carImageStandart")!),
                                       BackendCarInfoModel(
                                           carName: "Tesla X",
                                           transmissionType: "automatic transmission",
                                           priceCategory: "Premim",
                                           fuelLevel: 67,
                                           carImage: UIImage(named: "carImageStandart")!)
                                   ]),
                               BackendCarCategoryModel(
                                category: "History".localized(),
                                   carsInfo: [
                                       BackendCarInfoModel(
                                           carName: "VW Polo",
                                           transmissionType: "manual transmission",
                                           priceCategory: "econom",
                                           fuelLevel: 100,
                                           carImage: UIImage(named: "carImageStandart")!),
       
                                       BackendCarInfoModel(
                                           carName: "Tesla Model s",
                                           transmissionType: "automatic transmission",
                                           priceCategory: "premium",
                                           fuelLevel: 100,
                                           carImage: UIImage(named: "carImageStandart"
                                                            )!),
                                   ])
                   ]
                           let dataStorage = CarInfoStorage(carInfoModels: backendDataModel)
                           let obtainer = InfoCarObtainer(dataStorage: dataStorage)
                           let cardataProvider = dataProvider(obtainer: obtainer)
        viewControllers = [
            generateVC(
                viewController: CarInfoTableViewController(dataProvider: cardataProvider),
                title: "History".localized(),
                image: UIImage(systemName: "book.fill")),
        generateVC(
            viewController: MapViewController(),
            title: "Map".localized(),
            image: UIImage(systemName: "mappin.and.ellipse")),
        generateVC(
            viewController: HomeViewController(),
            title: "Home".localized(),
            image: UIImage(systemName: "house.fill")),
//            generateVC(
//                viewController: GameViewController(),
//                title: "Game",
//                image: UIImage(systemName: "gamecontroller.fill"))
        ]
    }
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBar() {
        let positionOnX: CGFloat = 8
        let positionOnY: CGFloat = 65
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY / 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(
            x: positionOnX,
            y: tabBar.bounds.maxY - positionOnY,
            width: width,
            height: height),
                                      cornerRadius: height)
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainColor.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
    
}
