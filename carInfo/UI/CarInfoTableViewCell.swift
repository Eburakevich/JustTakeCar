//
//  CarInfoTableViewCell.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 20.05.22.
//

import UIKit

class CarInfoTableViewCell: UITableViewCell {
    
    func update(dataModel: CarDataModel) {
        carNameLabel.text = dataModel.car
        priceCategoryLabel.text = dataModel.priceCategory
        fuelLabel.text = dataModel.fuelPercentage
        transmissionTypeLabel.text = dataModel.transmissionType
        carImage.image = dataModel.carImage
    }
        private lazy var priceCategoryLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            return label
        }()
        private lazy var carNameLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 2
            label.font = UIFont.boldSystemFont(ofSize: 17)
            return label
        }()
        private lazy var transmissionTypeLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            return label
        }()
        private lazy var fuelLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            return label
        }()
    private lazy var carImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        return image
    }()
        private let containerView = UIView()
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            selectionStyle = .none
            addSubviews()
            setupConstraints()
            configureContainer()
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        private func addSubviews() {
            [containerView, priceCategoryLabel, carImage, carNameLabel, fuelLabel, transmissionTypeLabel].forEach { subview in
                contentView.addSubview(subview)
                subview.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        private func setupConstraints() {
            setupFuel()
            setupName()
            setupTransmission()
            setupCategory()
            setupImage()
            setupContainer()
        }
        private func configureContainer() {
            containerView.addSubview(priceCategoryLabel)
            containerView.addSubview(carImage)
            containerView.addSubview(carNameLabel)
            containerView.addSubview(fuelLabel)
            containerView.addSubview(transmissionTypeLabel)
            containerView.layer.cornerRadius = 20
            containerView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            containerView.translatesAutoresizingMaskIntoConstraints = false
            priceCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
            carImage.translatesAutoresizingMaskIntoConstraints = false
            transmissionTypeLabel.translatesAutoresizingMaskIntoConstraints = false
            carNameLabel.translatesAutoresizingMaskIntoConstraints = false
            fuelLabel.translatesAutoresizingMaskIntoConstraints = false
        }
        private func setupCategory() {
            let topConst = NSLayoutConstraint(
                item: priceCategoryLabel,
                attribute: .top,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .top,
                multiplier: 1,
                constant: 12)
            let leadingConst = NSLayoutConstraint(
                item: priceCategoryLabel,
                attribute: .leading,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .leading,
                multiplier: 1,
                constant: 102)
            topConst.isActive = true
            leadingConst.isActive = true
        }
        private func setupName() {
            let topConst = NSLayoutConstraint(
                item: carNameLabel,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .centerY,
                multiplier: 1,
                constant: 0)
            let leadingConst = NSLayoutConstraint(
                item: carNameLabel,
                attribute: .leading,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .leading,
                multiplier: 1,
                constant: 102)
            topConst.isActive = true
            leadingConst.isActive = true
        }
        private func setupTransmission() {
            let topConst = NSLayoutConstraint(
                item: transmissionTypeLabel,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .bottom,
                multiplier: 1,
                constant: -19)
            let leadingConst = NSLayoutConstraint(
                item: transmissionTypeLabel,
                attribute: .leading,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .leading,
                multiplier: 1,
                constant: 102)
            topConst.isActive = true
            leadingConst.isActive = true
        }
        private func setupFuel() {
            let topConst = NSLayoutConstraint(
                item: fuelLabel,
                attribute: .top,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .top,
                multiplier: 1,
                constant: 12)
            let leadingConst = NSLayoutConstraint(
                item: fuelLabel,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .trailing,
                multiplier: 1,
                constant: -12)
            topConst.isActive = true
            leadingConst.isActive = true
        }
        private func setupImage() {
            let topConst = NSLayoutConstraint(
                item: carImage,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .centerY,
                multiplier: 1,
                constant: 0)
            let leadingConst = NSLayoutConstraint(
                item: carImage,
                attribute: .leading,
                relatedBy: .equal,
                toItem: containerView,
                attribute: .leading,
                multiplier: 1,
                constant: 12)
            let heightConst = NSLayoutConstraint(
                item: carImage,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 64)
            let widthConst = NSLayoutConstraint(
                item: carImage,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 64)
            widthConst.isActive = true
            heightConst.isActive = true
            topConst.isActive = true
            leadingConst.isActive = true
        }
        private func setupContainer() {
            let topConst = NSLayoutConstraint(
                item: containerView,
                attribute: .top,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .top,
                multiplier: 1,
                constant: 8)
            let leadingConst = NSLayoutConstraint(
                item: containerView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .leading,
                multiplier: 1,
                constant: 16)
            let trailingConst = NSLayoutConstraint(
                item: containerView,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .trailing,
                multiplier: 1,
                constant: -16)
            let botomConst = NSLayoutConstraint(
                item: containerView,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 102)
            let botom = NSLayoutConstraint(
                item: containerView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .bottom,
                multiplier: 1,
                constant: 0)
            botom.isActive = true
            botomConst.isActive = true
            trailingConst.isActive = true
            topConst.isActive = true
            leadingConst.isActive = true
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
    }
   



