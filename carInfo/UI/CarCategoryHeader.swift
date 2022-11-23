//
//  CarCategoryHeader.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 20.05.22.
//

import UIKit

final class CarCategoryHeader: UIView {

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Futura-Bold", size: 26)
        
        return label
    }()
        var title: String? {
            get { headerLabel.text }
            set { headerLabel.text = newValue }
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
            
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupUI()
        }
    private lazy var leadingHeaderConstraint =  headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
}
    private extension CarCategoryHeader {
        func setupUI() {
            addSubviews()
            setupConstraintsHeader()
            backgroundColor = .white
        }
        func addSubviews() {
            headerLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(headerLabel)
        }
        
      private func setupConstraintsHeader() {
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
          leadingHeaderConstraint.isActive = true
        }
       
            
    }


