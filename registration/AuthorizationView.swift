//
//  AuthorizationView.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit

protocol StartScreenActionResponsible: AnyObject {
    func okButtonDidTup()
    func noButtonDidTup()

}

class AuthorizationView: UIView {
    
    weak var delegateStart: StartScreenActionResponsible?
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your details".localized()
        label.textColor = .black
        label.numberOfLines = 4
        label.textAlignment = .left
        label.font = UIFont(name: "Futura-Bold", size: 40)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Login".localized()
        textField.addTarget(self, action: #selector(didEndLogin), for: .primaryActionTriggered)
        return textField
    }()
    @objc private func didEndLogin() {
        loginTextField.endEditing(true)
    }
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password".localized()
        textField.addTarget(self, action: #selector(didEndPassword), for: .primaryActionTriggered)
        return textField
    }()
    
    @objc private func didEndPassword() {
        passwordTextField.endEditing(true)
    }
    
    private let okButton: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("     Enter     ".localized(), for: .normal)
        buttom.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
         buttom.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
        buttom.backgroundColor = .black
        buttom.layer.cornerRadius = 12
        buttom.addTarget(self, action: #selector(okDidTap), for: .touchUpInside)
        buttom.translatesAutoresizingMaskIntoConstraints = false
        return buttom
    }()

    @objc private func okDidTap() {
        delegateStart?.okButtonDidTup()
        
    }
    
    private let noRegButton: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("   Registration   ".localized(), for: .normal)
        buttom.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
         buttom.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
        buttom.backgroundColor = .black
        buttom.layer.cornerRadius = 12
        buttom.addTarget(self, action: #selector(noRegDidTap), for: .touchUpInside)
        buttom.translatesAutoresizingMaskIntoConstraints = false
        return buttom
    }()

    @objc private func noRegDidTap() {
        delegateStart?.noButtonDidTup()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(okButton)
        addSubview(welcomeLabel)
        addSubview(noRegButton)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
       
        setupConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 168).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
        
        
        loginTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 64).isActive = true
    loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
      
      
        
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 48).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
      
        
        okButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 64).isActive = true

        okButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        
        noRegButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 64).isActive = true

        noRegButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true

        
    }
    

}
