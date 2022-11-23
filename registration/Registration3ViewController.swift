//
//  Registration3ViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit

final class Registration3ViewController: UIViewController, RegScreenActionResponsible {
    
    func nextButtonDidTup() {
        let controller = Registration4ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }

    private let registration3View = Registration3View()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registration3View
        view.backgroundColor = .white.withAlphaComponent(0.9)
        registration3View.delegateReg4 = self
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Step back".localized(), style: .plain, target: self, action: #selector(backTo2))
    }
    @objc private func backTo2() {
        let controller = Registration2ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
}
