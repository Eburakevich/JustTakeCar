//
//  Registration4ViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit

final class Registration4ViewController: UIViewController, AuthScreenActionResponsible, RegScreenActionResponsible {
    func nextButtonDidTup() {
        let controller = Registration5ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    
    func yesButtonDidTup() {
        let controller = Registration5ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    
    
   

    private let registration4View = Registration4View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registration4View
        view.backgroundColor = .white.withAlphaComponent(0.9)
        registration4View.delegateReg5 = self
        registration4View.documentsLabelButton.addTarget(self, action: #selector(createPhoto), for: .touchUpInside)
}
    
    var imageView = UIImageView()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Step back".localized(), style: .plain, target: self, action: #selector(backTo3))
    }
    @objc private func backTo3() {
        let controller = Registration3ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    @objc func createPhoto() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
  
    }
    
    }
    
    
extension Registration4ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as?
                UIImage else {
            return
        }
        imageView.image = image
    }
}
