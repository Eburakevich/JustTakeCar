//
//  Registration3View.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//



import UIKit

class Registration3View: UIView {
    
    weak var delegateReg4: RegScreenActionResponsible?
    
        private let welcomeLabel: UILabel = {
            let label = UILabel()
            label.text = "Step 3/5".localized()
            label.textColor = .black
            label.textAlignment = .right
            label.font = UIFont(name: "Futura-Bold", size: 40)
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            return label
        }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .left
        label.font = UIFont(name: "Futura-Bold", size: 16)
        return label
    }()
    
    let picker = UIDatePicker()
        lazy var ageCreateTextField: UITextField = {
            let textField = UITextField()
            picker.datePickerMode = .date
            picker.preferredDatePickerStyle = .wheels
            picker.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "enter date of birth".localized()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            textField.inputView = picker
            picker.addTarget(self, action: #selector(self.valuechanged), for: .valueChanged)
            textField.addTarget(self, action: #selector(didEndAge), for: .primaryActionTriggered)
            return textField
        }()
    
    func ageIsValid() -> Bool {
    let calendar = NSCalendar.current
    let dateNow = Date()
    let birthay = picker.date
    let age = calendar.dateComponents([.year], from: birthay, to: dateNow)
    let ageYear = age.year
    guard let ageUser = ageYear else {
        return false
    }
    return (ageUser < 18 ? false: true)
    }
    
    @objc private func valuechanged(sender: UIDatePicker) {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        dateFormat.dateFormat = "dd.MM.yyyy"
        self.ageCreateTextField.text = dateFormat.string(from: sender.date)
    }
    
        @objc private func didEndAge() {
            ageCreateTextField.endEditing(true)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
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
         
                delegateReg4?.nextButtonDidTup()
          
        }
 
        override init(frame: CGRect) {
            super.init(frame: frame)

            addSubview(welcomeLabel)
            addSubview(ageCreateTextField)
            addSubview(nextButton)
            addSubview(dateLabel)
            welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
           
            setupConstraints()
           
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupConstraints() {
           
          
            
            
            
        welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 208).isActive = true
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
          
            
            ageCreateTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160).isActive = true
            ageCreateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
                ageCreateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
            
            nextButton.topAnchor.constraint(equalTo: ageCreateTextField.bottomAnchor, constant: 160).isActive = true

            dateLabel.bottomAnchor.constraint(equalTo: ageCreateTextField.topAnchor, constant: -32).isActive = true
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            
            
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
            
        }

    }

