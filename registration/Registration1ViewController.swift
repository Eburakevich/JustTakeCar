//
//  RegistrationViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit

final class Registration1ViewController: UIViewController, RegScreenActionResponsible, NameUserChancheListening {
    
    var userLogin = UserLogin(login: "")
    
    func nameUserChange(_ text: String) {
        userLogin.login = text
        }
    
    func nextButtonDidTup() {
        
        let controller = Registration2ViewController()
            navigationController?.pushViewController(controller, animated: false)
    
}

    private let registration1View = Registration1View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registration1View
        view.backgroundColor = .white.withAlphaComponent(0.9)
        registration1View.delegateReg2 = self
        registration1View.delegateName = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "To the beginning".localized(), style: .plain, target: self, action: #selector(back))
    }
    @objc private func back() {
        let controller = WelcomViewController()
            navigationController?.pushViewController(controller, animated: false)
    }


}
