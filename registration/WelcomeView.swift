//
//  WelcomeView.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit

protocol AuthScreenActionResponsible: AnyObject {
    func yesButtonDidTup()
}
protocol Reg1ScreenActionResponsible: AnyObject {
    func noButtonDidTup()
}

final class WelcomeView: UIView {
    
    weak var delegatAuth: AuthScreenActionResponsible?
    weak var delegateReg: Reg1ScreenActionResponsible?
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, do you have an account?".localized()
        label.textColor = .black
        label.numberOfLines = 4
        label.textAlignment = .left
        label.font = UIFont(name: "Futura-Bold", size: 40)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    
    private let yesButton: UIButton = {
        let button = UIButton()
        button.setTitle("   Yes   ".localized(), for: .normal)
       
        button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
         button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(yesDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func yesDidTap() {
        delegatAuth?.yesButtonDidTup()
            
        }
    private let noButton: UIButton = {
        let button = UIButton()
        button.setTitle("   No   ".localized(), for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(noDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc private func noDidTap() {
        delegateReg?.noButtonDidTup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(welcomeLabel)
        addSubview(yesButton)
        addSubview(noButton)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
       
        setupConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
    welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 168).isActive = true
    welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        
        
        yesButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 208).isActive = true
        yesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48).isActive = true
      
        
        noButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 208).isActive = true

        noButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48).isActive = true
        
    }
 
}
