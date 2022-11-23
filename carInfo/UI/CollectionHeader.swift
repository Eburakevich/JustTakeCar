//
//  CollectionHeader.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 24.06.22.
//

import UIKit

final class CollectionCategoryHeader: UIView {

    let headerLabelCollection: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Futura-Bold", size: 26)
        
        return label
    }()
        var title: String? {
            get { headerLabelCollection.text }
            set { headerLabelCollection.text = newValue }
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
            
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupUI()
        }
    private lazy var leadingHeaderConstraint: () =  headerLabelCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
}
    private extension CollectionCategoryHeader {
        func setupUI() {
            addSubviews()
            setupConstraintsHeader()
            
            backgroundColor = .white
        }
        func addSubviews() {
            headerLabelCollection.translatesAutoresizingMaskIntoConstraints = false
            addSubview(headerLabelCollection)
           
        }
        
      private func setupConstraintsHeader() {
          headerLabelCollection.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
          headerLabelCollection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
          
        }
       
        



    }
