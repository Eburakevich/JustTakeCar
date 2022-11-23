//
//  RegistrationView.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit
struct UserLogin {
    var login: String
}
protocol NameUserChancheListening: AnyObject {
    func nameUserChange(_ text: String)
}
protocol RegScreenActionResponsible: AnyObject {
    func nextButtonDidTup()
}

class Registration1View: UIView {
    weak var delegateName: NameUserChancheListening?
    weak var delegateReg2: RegScreenActionResponsible?
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Step 1/5".localized()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Futura-Bold", size: 40)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()

    let loginCrateTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "enter email".localized()
        textField.addTarget(self, action: #selector(didEndLogin), for: .primaryActionTriggered)
        textField.addTarget(self, action: #selector(nameDidChange), for: .editingChanged)
        return textField
    }()
    
@objc func nameDidChange(_ sender: UITextField) {
    delegateName?.nameUserChange(sender.text ?? "")
}
    
    @objc private func didEndLogin() {
        loginCrateTextField.endEditing(true)
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
        delegateReg2?.nextButtonDidTup()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(welcomeLabel)
        addSubview(loginCrateTextField)
        addSubview(nextButton)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        loginCrateTextField.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
    welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 208).isActive = true
    welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
        loginCrateTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160).isActive = true
        loginCrateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
        loginCrateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
        nextButton.topAnchor.constraint(equalTo: loginCrateTextField.bottomAnchor, constant: 160).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
    }
}
