//
//  Registration2View.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit

class Registration2View: UIView {

    weak var delegateReg3: RegScreenActionResponsible?
    
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Step 2/5".localized()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Futura-Bold", size: 40)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        return label
    }()

    let phoneCrateTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "enter your phone number".localized()
        textField.keyboardType = .numbersAndPunctuation
        textField.addTarget(self, action: #selector(didEndPhone), for: .primaryActionTriggered)
        return textField
    }()
    @objc private func didEndPhone() {
        phoneCrateTextField.endEditing(true)
    }

    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("     next     ".localized(), for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(nextDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc private func nextDidTap() {
        delegateReg3?.nextButtonDidTup()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(welcomeLabel)
        addSubview(phoneCrateTextField)
        addSubview(nextButton)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneCrateTextField.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
       
        setupConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
    welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 208).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
        
        
        phoneCrateTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160).isActive = true
        phoneCrateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            phoneCrateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: phoneCrateTextField.bottomAnchor, constant: 160).isActive = true

        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
        
    }

}
