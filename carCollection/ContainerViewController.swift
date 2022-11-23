//
//  ContainerViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 14.06.22.
//

import UIKit

final class ContainerView: UIView {
   let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 36 - 16 - 8 * 3) / 4, height: 100)
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .init(top: 0, left: 36, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
       collectionView.showsHorizontalScrollIndicator = false
        return collectionView
}()
    
    let labelTittle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "TOP"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    let carType: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Premium"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelTittle, carType])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        stack.layer.cornerRadius = 20
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContainer()
        addSubviews()
        backgroundColor = .white
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubviews() {
        addSubview(stackView)
        addSubview(collectionView)
    }
        func setupContainer() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            
            func setupStack() {
                let topConst = NSLayoutConstraint(
                    item: stackView,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .top,
                    multiplier: 1,
                    constant: 0)
                let leadingConst = NSLayoutConstraint(
                    item: stackView,
                    attribute: .leading,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .leading,
                    multiplier: 1,
                    constant: 0)
                let trailingConst = NSLayoutConstraint(
                    item: stackView,
                    attribute: .trailing,
                    relatedBy: .equal,
                    toItem: trailingAnchor,
                    attribute: .trailing,
                    multiplier: 1,
                    constant: 0)
                topConst.isActive = true
                leadingConst.isActive = true
                trailingConst.isActive = true
            }
      
            func setupCollection() {
                let topConst = NSLayoutConstraint(
                    item: collectionView,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: stackView,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 48)
                let leadingConst = NSLayoutConstraint(
                    item: collectionView,
                    attribute: .leading,
                    relatedBy: .equal,
                    toItem: leadingAnchor,
                    attribute: .leading,
                    multiplier: 1,
                    constant: 0)
                let trailingConst = NSLayoutConstraint(
                    item: collectionView,
                    attribute: .trailing,
                    relatedBy: .equal,
                    toItem: trailingAnchor,
                    attribute: .trailing,
                    multiplier: 1,
                    constant: 0)
                let heightConst = NSLayoutConstraint(
                    item: collectionView,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: .none,
                    attribute: .height,
                    multiplier: 1,
                    constant: 100)
                topConst.isActive = true
                leadingConst.isActive = true
                trailingConst.isActive = true
                heightConst.isActive = true
            }
            
//            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 48).isActive = true
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//            collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
}
    

class ContainerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCollectionViewCell", for: indexPath) as! CarCollectionViewCell
        
        cell.carNameLabel.text = "TESLA model X"
        return cell
    }
    
    
    private let customView = ContainerView()
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.collectionView.register(CarCollectionViewCell.self, forCellWithReuseIdentifier: "CarCollectionViewCell")
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
    
    }
    


}
