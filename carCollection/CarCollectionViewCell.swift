//
//  CarCollectionViewCell.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 14.06.22.
//

import UIKit

final class CarCollectionViewCell: UICollectionViewCell {
    
    let carNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

let carImage: UIImageView = {
    let image = UIImageView()
    image.tintColor = .black
    image.image = UIImage(named: "carImageStandart")
    image.widthAnchor.constraint(equalToConstant: 64).isActive = true
    image.heightAnchor.constraint(equalToConstant: 64).isActive = true
    return image
}()
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [carImage, carNameLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        stack.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        stack.layer.cornerRadius = 20
        return stack
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        addSubviews()
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
private extension CarCollectionViewCell {
    func addSubviews() {
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        func setupContainer() {
            let topConst = NSLayoutConstraint(
                item: stackView,
                attribute: .top,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .top,
                multiplier: 1,
                constant: 0)
            let leadingConst = NSLayoutConstraint(
                item: stackView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .leading,
                multiplier: 1,
                constant: 16)
            let trailingConst = NSLayoutConstraint(
                item: stackView,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .trailing,
                multiplier: 1,
                constant: -16)
            let botomConst = NSLayoutConstraint(
                item: stackView,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 90)
            let botom = NSLayoutConstraint(
                item: stackView,
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
        
//        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 1).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 1).isActive = true
    }
}
