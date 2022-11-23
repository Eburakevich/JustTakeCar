//
//  StartCarView.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 24.05.22.
//

import UIKit

final class StartCarView: UIView {

    let welcomLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemYellow
        label.text = "Hi, driver".localized()
        label.font = UIFont(name: "Futura-Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = false
        return label
    }()
    let wheelImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage.gifImageWithName("wheel_gif")
        image.isUserInteractionEnabled = true
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(welcomLabel)
        addSubview(wheelImage)
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstraints() {
        setupWheelConstraints()
        setupWelcomLabelConstraints()
    }
       private func setupWheelConstraints() {
            let centerYConstraint = NSLayoutConstraint(item: wheelImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
            let centerXConstraint = NSLayoutConstraint(item: wheelImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
                let heightConstraint = NSLayoutConstraint(item: wheelImage, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .height, multiplier: 1, constant: 250)
            let widgtConstraint = NSLayoutConstraint(item: wheelImage, attribute: .width,relatedBy: .equal, toItem: .none, attribute: .width, multiplier: 1, constant: 250)
           [centerYConstraint, centerXConstraint, heightConstraint, widgtConstraint].forEach {
               $0.isActive = true
           }
        }
    
    private func setupWelcomLabelConstraints() {
         let centerXConstraint = NSLayoutConstraint(item: welcomLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
             let topConstraint = NSLayoutConstraint(item: welcomLabel, attribute: .topMargin, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 36)
        [centerXConstraint, topConstraint].forEach {
            $0.isActive = true
        }
     }
        }
    
    
  
    
 
