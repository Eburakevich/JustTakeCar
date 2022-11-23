//
//  AuthorizationViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit


final class AuthorizationViewController: UIViewController, StartScreenActionResponsible {
   
    func noButtonDidTup() {
 
        let controller = Registration1ViewController()
            navigationController?.pushViewController(controller, animated: false)
    
    }
    
    func okButtonDidTup() {
 
        let login = authView.loginTextField.text ?? ""
        let password = authView.passwordTextField.text ?? ""
        let user = findUser(login: login)
        
        if user == nil {
            authView.welcomeLabel.text = "User is not found".localized()
            authView.welcomeLabel.textColor = .red
        }
        else if user?.password == password {
            
            let controller = StartCarViewController()
                navigationController?.pushViewController(controller, animated: false)
            guard let activeUser = user else { return }
            DataBase.shared.saveActiveUser(user: activeUser)
            
            
        } else {
            authView.welcomeLabel.text = "Invalid password".localized()
            authView.welcomeLabel.textColor = .red
    }
    }
    
    private let authView = AuthorizationView()
    
    override func viewDidLoad() {
        view = authView
        super.viewDidLoad()

        authView.delegateStart = self
        view.backgroundColor = .white.withAlphaComponent(0.9)
        
    }
    
    private func findUser(login: String) -> User? {
        let dataBase = DataBase.shared.users
        print(dataBase)
        
        for user in dataBase {
            if user.login == login {
                return user
            }
        }
        return nil
    }

}
