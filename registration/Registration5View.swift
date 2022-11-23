//
//  Registration5View.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 23.07.22.
//

import UIKit
    class Registration5View: UIView {
        weak var delegatAuth: AuthScreenActionResponsible?
        private let welcomeLabel: UILabel = {
            let label = UILabel()
            label.text = "Step 5/5".localized()
            label.textColor = .black
            label.textAlignment = .right
            label.font = UIFont(name: "Futura-Bold", size: 40)
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            return label
        }()
        private let passwordLabel: UILabel = {
            let label = UILabel()
            label.textColor = .red
            label.textAlignment = .left
            label.font = UIFont(name: "Futura-Bold", size: 16)
            return label
        }()
        
        let loginCrateTextField: UITextField = {
            let textField = UITextField()
            textField.borderStyle = .roundedRect
            textField.placeholder = "create a login".localized()
            textField.addTarget(self, action: #selector(didEndLogin), for: .primaryActionTriggered)
            return textField
        }()
        
 
        @objc private func didEndLogin() {
            loginCrateTextField.endEditing(true)
        }
        
       let passwordCrateTextField: UITextField = {
            let textField = UITextField()
            textField.borderStyle = .roundedRect
           textField.placeholder = "create a password".localized()
            textField.isSecureTextEntry = true
            textField.addTarget(self, action: #selector(didEndpassword), for: .primaryActionTriggered)
            return textField
        }()
        
        @objc private func didEndpassword() {
            passwordCrateTextField.endEditing(true)
        }
        private let passwordDoneCrateTextField: UITextField = {
            let textField = UITextField()
            textField.borderStyle = .roundedRect
            textField.placeholder = "repeat password".localized()
            textField.isSecureTextEntry = true
            textField.addTarget(self, action: #selector(didEndpasswordDone), for: .primaryActionTriggered)
            return textField
        }()
        
        @objc private func didEndpasswordDone() {
            passwordDoneCrateTextField.endEditing(true)
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
            if passwordCrateTextField.text == passwordDoneCrateTextField.text{
            delegatAuth?.yesButtonDidTup()
            } else {
                passwordLabel.text = ""
            }
        }
        private let yeyPassword: UIButton = {
            let buttom = UIButton()
            buttom.backgroundColor = .clear
            buttom.setTitle("show", for: .normal)
            buttom.setImage(UIImage(named: "eye"), for: .normal)
            buttom.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            buttom.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.7) , for: .highlighted)
            buttom.addTarget(self, action: #selector(changeYeyPassword), for: .touchUpInside)
            buttom.backgroundColor = .white
            buttom.layer.cornerRadius = 4
            buttom.translatesAutoresizingMaskIntoConstraints = false
            return buttom
        }()
        
        private var clickCounter = 1
        @objc private func changeYeyPassword() {
            clickCounter += 1
            if clickCounter % 2 == 0 {
        yeyPassword.setTitle("hide", for: .normal)
            passwordCrateTextField.isSecureTextEntry = false
        }
            else {
                yeyPassword.setTitle("show", for: .normal)
                    passwordCrateTextField.isSecureTextEntry = true
            }
        }
        private let yeyPassworddone: UIButton = {
            let buttom = UIButton()
            buttom.backgroundColor = .clear
            buttom.setTitle("show", for: .normal)
            buttom.setImage(UIImage(named: "eye"), for: .normal)
            buttom.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            buttom.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.7) , for: .highlighted)
            buttom.addTarget(self, action: #selector(changeYeyPasswordDone), for: .touchUpInside)
            buttom.backgroundColor = .white
            buttom.layer.cornerRadius = 4
            buttom.translatesAutoresizingMaskIntoConstraints = false
            return buttom
        }()
        
        private var clickCounter_done = 1
        @objc private func changeYeyPasswordDone() {
            clickCounter_done += 1
            if clickCounter_done % 2 == 0 {
        yeyPassworddone.setTitle("hide", for: .normal)
            passwordDoneCrateTextField.isSecureTextEntry = false
        }
            else {
                yeyPassworddone.setTitle("show", for: .normal)
                    passwordDoneCrateTextField.isSecureTextEntry = true
            }
        }
        
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.endEditing(true)
        }
        override init(frame: CGRect) {
            super.init(frame: frame)

            addSubview(welcomeLabel)
            addSubview(passwordCrateTextField)
            addSubview(passwordDoneCrateTextField)
            addSubview(nextButton)
            addSubview(passwordLabel)
            addSubview(yeyPassword)
            addSubview(yeyPassworddone)
            addSubview(loginCrateTextField)
            loginCrateTextField.translatesAutoresizingMaskIntoConstraints = false
            yeyPassworddone.translatesAutoresizingMaskIntoConstraints = false
            yeyPassword.translatesAutoresizingMaskIntoConstraints = false
            passwordLabel.translatesAutoresizingMaskIntoConstraints = false
            welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
            passwordCrateTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordDoneCrateTextField.translatesAutoresizingMaskIntoConstraints = false
            nextButton.translatesAutoresizingMaskIntoConstraints = false
           
            setupConstraints()
           
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupConstraints() {
        welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 208).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
          
            loginCrateTextField.bottomAnchor.constraint(equalTo: passwordCrateTextField.topAnchor, constant: -32).isActive = true
            loginCrateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            
            passwordLabel.bottomAnchor.constraint(equalTo: passwordCrateTextField.topAnchor, constant: -32).isActive = true
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            
            
            yeyPassword.bottomAnchor.constraint(equalTo: passwordDoneCrateTextField.topAnchor, constant: -32).isActive = true
            yeyPassword.leadingAnchor.constraint(equalTo: passwordCrateTextField.trailingAnchor, constant: 8).isActive = true
            yeyPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
           
            
            yeyPassworddone.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160).isActive = true
            yeyPassworddone.leadingAnchor.constraint(equalTo: passwordDoneCrateTextField.trailingAnchor, constant: 8).isActive = true
            yeyPassworddone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
            
            passwordCrateTextField.bottomAnchor.constraint(equalTo: passwordDoneCrateTextField.topAnchor, constant: -32).isActive = true
            passwordCrateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            passwordCrateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -88).isActive = true
//
            passwordDoneCrateTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160).isActive = true
            passwordDoneCrateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            passwordDoneCrateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -88).isActive = true
          
            
            nextButton.topAnchor.constraint(equalTo: passwordCrateTextField.bottomAnchor, constant: 160).isActive = true

            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            
        }

    }
