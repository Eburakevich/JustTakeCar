//
//  Registration2ViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit

final class Registration2ViewController: UIViewController, RegScreenActionResponsible, UITextFieldDelegate {
    func nextButtonDidTup() {
        let controller = Registration3ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    

    
    private let registration2View = Registration2View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registration2View
        view.backgroundColor = .white.withAlphaComponent(0.9)
        registration2View.delegateReg3 = self
        registration2View.phoneCrateTextField.delegate = self
        registration2View.phoneCrateTextField.addTarget(self, action: #selector(didEndPhone), for: .primaryActionTriggered)
    
    }
    @objc private func didEndPhone() {
        registration2View.phoneCrateTextField.endEditing(true)

    }
    func formatPhoneNumber(number: String) -> String {
            let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            let mask = "+XXX (XX) XXX-XX-XX"
            var result = ""
            var index = cleanPhoneNumber.startIndex
            for ch in mask where index < cleanPhoneNumber.endIndex {
                if ch == "X" {
                    result.append(cleanPhoneNumber[index])
                    index = cleanPhoneNumber.index(after: index)
                }
                else {
                    result.append(ch)
                }
            }
            return result
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
        registration2View.phoneCrateTextField.text = formatPhoneNumber(number: newString)
            return false
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        guard let text = registration2View.phoneCrateTextField.text else { return false }
//        let newString = (text as NSString).replacingCharacters(in: range, with: string)
//        registration2View.phoneCrateTextField.text = formatPhoneNumber(number: newString)
//
//        if textField == registration2View.phoneCrateTextField {
//                    let allowedCharacters = "1234567890"
//                    let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
//                    let typedCharacterSet = CharacterSet(charactersIn: string)
//                    let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
//                    let Range = range.length + range.location > (registration2View.phoneCrateTextField.text?.count)!
//            if Range == false && alphabet == false {
//                return false
//            }
//            let NewLength = (registration2View.phoneCrateTextField.text?.count)! + string.count - range.length
//            return NewLength <= 13
//        }
//        return true
//
//}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Step back".localized(), style: .plain, target: self, action: #selector(backTo1))
    }
    @objc private func backTo1() {
        let controller = Registration1ViewController()
            navigationController?.pushViewController(controller, animated: false)
    }
    
    
    
   

}
