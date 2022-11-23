//
//  HomeViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 15.09.22.
//
import Foundation
import UIKit
import WebKit


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AuthScreenActionResponsible, UIWebViewDelegate, WKNavigationDelegate {
    
    
    func yesButtonDidTup() {
         self.navigationController?.pushViewController(AuthorizationViewController(), animated: true)
         self.navigationController?.viewControllers.remove(at: .zero)
        self.navigationItem.hidesBackButton = true 
        
    }
    

    
    private let cars = [CarDataModel(
        car: "Polo",
        transmissionType: "Manual",
        priceCategory: "Econom",
        fuelPercentage: "",
        carImage: UIImage(named: "carImageStandart")!),
    CarDataModel(
        car: "Kia RIO",
        transmissionType: "Manual",
        priceCategory: "Econom",
        fuelPercentage: "",
        carImage: UIImage(named: "carImageStandart")!),
                        CarDataModel(
                            car: "BMW 5-s",
                            transmissionType: "Manual",
                            priceCategory: "Premium",
                            fuelPercentage: "",
                            carImage: UIImage(named: "carImageStandart")!),
                        CarDataModel(
                            car: "Logan",
                            transmissionType: "Manual",
                            priceCategory: "Econom",
                            fuelPercentage: "",
                            carImage: UIImage(named: "carImageStandart")!),
    CarDataModel(
        car: "LADA WESTA",
        transmissionType: "Manual",
        priceCategory: "Econom",
        fuelPercentage: "",
        carImage: UIImage(named: "carImageStandart")!)]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarInfoTableViewCell") as! CarInfoTableViewCell
        cell.update(dataModel: cars[indexPath.row])
        return cell
    }
    let customView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view = customView
        view.backgroundColor = .white
        customView.delegatExit = self
        customView.popularCarTableView.delegate = self
        customView.popularCarTableView.dataSource = self
        customView.popularCarTableView.separatorStyle = .none
        customView.popularCarTableView.rowHeight = UITableView.automaticDimension
        customView.popularCarTableView.register(CarInfoTableViewCell.self, forCellReuseIdentifier: "CarInfoTableViewCell")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Step back", style: .plain, target: nil, action: nil)
        let url = URL(string: "https://help.mywheels.nl/hc/nl")!
        customView.infoView.load(URLRequest(url: url))
        customView.infoView.allowsBackForwardNavigationGestures = true
        
    }
    

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let view = CarCategoryHeader()
         if section == 0 {
             view.title = "POPULAR CARS".localized()
         }
         return view
     }

}
