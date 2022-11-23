//
//  NewContainerViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 20.06.22.
//

import UIKit

final class NewContainerView: UIView {
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 8

        flowLayout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 64), height: 100)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    
    private lazy var carName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "example"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [carName])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        stack.layer.cornerRadius = 20
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension NewContainerView {
    
    func addSubviews() {
        addSubview(stackView)
        addSubview(collectionView)
    }
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 104).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 48).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}




class NewContainerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var containerDataProvider: dataProvider
    var containerDataModel: [CarDataModel]

    var products: [carCollectionDataModel]
    init(containerDataProvider: dataProvider,
         containerDataModel: [CarDataModel], products: [carCollectionDataModel]) {
        self.containerDataProvider = containerDataProvider
        self.containerDataModel = containerDataModel
        self.products = products
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCarCollectionViewCell", for: indexPath) as! NewCarCollectionViewCell
    
        cell.carName.text = products[indexPath.row].carNameData
        cell.priceCategoryLabel.text = products[indexPath.row].priceCategoryData
        cell.fuelLabel.text = products[indexPath.row].fuelLabelData
        cell.transmissionTypeLabel.text = products[indexPath.row].transmissionTypeLabelData
        
    return cell
    }

    

private let customView = NewContainerView()
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.collectionView.register(NewCarCollectionViewCell.self, forCellWithReuseIdentifier: "NewCarCollectionViewCell")
        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    

   
}
