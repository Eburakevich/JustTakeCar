//
//  NewCarCollectionViewCell.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 20.06.22.


import UIKit

final class NewCarCollectionViewCell: UICollectionViewCell {
    
//    func update(dataModel: CarDataModel) {
//        carName.text = dataModel.car
//        priceCategoryLabel.text = dataModel.priceCategory
//        fuelLabel.text = dataModel.fuelPercentage
//        transmissionTypeLabel.text = dataModel.transmissionType
//        image.image = dataModel.carImage
//    }
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.image = UIImage(named: "carImageStandart")
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return imageView
    }()
    
    let carName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "TESLA Model S"
        return label
    }()
    
   let priceCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "premium"
        return label
    }()
    let transmissionTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "automatic transmission"
        return label
    }()
    let fuelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "fuel level 100 %"
        return label
    }()

    
    private lazy var verticalStackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [priceCategoryLabel, carName, transmissionTypeLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        stack.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        stack.layer.cornerRadius = 20
        return stack
    }()
    
    private lazy var horizontalStackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [image, verticalStackView, fuelLabel])
        stack.axis = .horizontal
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension NewCarCollectionViewCell {
    
    func addSubviews() {
        contentView.addSubview(verticalStackView)
        contentView.addSubview(horizontalStackView)
    }
    func setupConstraints() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}
