//
//  Registration5ViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 23.07.22.
//

import UIKit

class Registration5ViewController: UIViewController, AuthScreenActionResponsible {
    
    func yesButtonDidTup() {
        let loginText = registration5View.loginCrateTextField.text ?? ""
        let passwordText = registration5View.passwordCrateTextField.text ?? ""
        
        if registration5View.loginCrateTextField.text == ""
            && registration5View.passwordCrateTextField.text == "" {
            alertOk(title: "Error", message: "Fill in all the fields")
        }
        
        DataBase.shared.saveUser(login: loginText,
                                 password: passwordText)
        
        
        let controller = AuthorizationViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    
    
   

    private let registration5View = Registration5View()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registration5View
        view.backgroundColor = .white.withAlphaComponent(0.9)
        registration5View.delegatAuth = self

    }
        // Do any additional setup after loading the view.

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Step back".localized(), style: .plain, target: self, action: #selector(backTo4))
    }
    @objc private func backTo4() {
        let controller = Registration4ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
