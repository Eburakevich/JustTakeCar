//
//  WelcomViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit

final class WelcomViewController: UIViewController, AuthScreenActionResponsible, Reg1ScreenActionResponsible {
    func noButtonDidTup() {
        let controller = Registration1ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    func yesButtonDidTup() {
        let controller = AuthorizationViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    private let welcomView = WelcomeView()
    override func viewDidLoad() {
        view = welcomView
        super.viewDidLoad()
        welcomView.delegatAuth = self
        welcomView.delegateReg = self
        view.backgroundColor = .white.withAlphaComponent(0.9)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = .init(title: "", style: .plain, target: .none, action: .none)
    }
}
