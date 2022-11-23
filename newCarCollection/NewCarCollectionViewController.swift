//
//  NewCarCollectionViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 20.06.22.
//

import UIKit
struct carCollectionDataModel {
    let carNameData: String
    let priceCategoryData: String
    let transmissionTypeLabelData: String
    let fuelLabelData: String
}
private let reuseIdentifier = "Cell"


final class NewCarCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
   private var products: [carCollectionDataModel]
   private var collectionDataProvider: dataProvider
    
    init(collectionDataProvider: dataProvider, products: [carCollectionDataModel]) {
        self.collectionDataProvider = collectionDataProvider
        self.products = products
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % 2 == 0 { return .init(width: 100, height: 100)}
        else {
            return .init(width: 200, height: 500)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(NewCarCollectionViewCell.self, forCellWithReuseIdentifier: "NewCarCollectionViewCell")
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCarCollectionViewCell", for: indexPath) as! NewCarCollectionViewCell
        cell.carName.text = products[indexPath.row].carNameData
        cell.priceCategoryLabel.text = products[indexPath.row].priceCategoryData
        cell.fuelLabel.text = products[indexPath.row].fuelLabelData
        cell.transmissionTypeLabel.text = products[indexPath.row].transmissionTypeLabelData
    return cell
    }
}
