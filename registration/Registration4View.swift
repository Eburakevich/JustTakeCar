//
//  Registration4View.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import UIKit



class Registration4View: UIView, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    weak var delegateReg5: RegScreenActionResponsible?
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Step 4/5".localized()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Futura-Bold", size: 40)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
 let documentsLabelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
     button.setTitle("Take a photo of your driver's license".localized(), for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
         button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
       
        return button
    }()
    
    
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
        delegateReg5?.nextButtonDidTup()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(welcomeLabel)
        addSubview(documentsLabelButton)
        addSubview(nextButton)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        documentsLabelButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
       
        setupConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
    welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 208).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64).isActive = true
      
        
        
        documentsLabelButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160).isActive = true
        documentsLabelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48).isActive = true
            documentsLabelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: documentsLabelButton.bottomAnchor, constant: 160).isActive = true

        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64).isActive = true
        
    }


}
