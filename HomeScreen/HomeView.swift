//
//  HomeView.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 15.09.22.
//

import UIKit
import WebKit

final class HomeView: UIView {
        
     let headerLabel = UILabel()
        private let descriptionLabel = UILabel()
        private let tabBarView = UIView()
        private let exitButton = UIButton()
        private let newEpisode = UILabel()

        private let payButton = UIButton()
        private let bonusButton = UIButton()
        private let questionButton = UIButton()
    
    let infoView = WKWebView()
    let bonusInfo = UILabel()
    let payField = UITextField()
    let payDone = UIButton()
    
      
    
    
        let popularCarTableView = UITableView(frame: .zero, style: .plain)
      
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubviews()
            preconFigureSubviews()
            configureHeader()
            configureDescription()
            setupConstraints()
            configureRecentButton()
            configureFeaturedButton()
            configureTrendingButton()
            configExitButton()
            setupInfoView()
      
            descriptionLabel.text = "User account".localized()
           
            headerLabel.text = "Hi, \(DataBase.shared.activeUser?.login ?? "driver")"
            exitButton.isUserInteractionEnabled = true
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
            headerLabel.isUserInteractionEnabled = true
        }
       
        required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
    

        private func addSubviews() {
            addSubview(headerLabel)
            addSubview(descriptionLabel)
            addSubview(exitButton)
            addSubview(bonusButton)
            addSubview(payButton)
            addSubview(questionButton)
            addSubview(tabBarView)
            addSubview(popularCarTableView)
            addSubview(infoView)
            addSubview(bonusInfo)
            addSubview(payField)
            addSubview(payDone)
        }
        private func preconFigureSubviews() {
            subviews.forEach{ element in element.translatesAutoresizingMaskIntoConstraints = false }
        }
        private func setupConstraints() {
            setupHeaderLabel()
            setupDescriptionLabel()
            setupUserImageConstraint()
            setupRecent()
            setupFeatured()
            setupTrending()
            setupTupBar()
            setupPopularTableView()
          
        }
    
    private func setupPayField() {
        
        payField.topAnchor.constraint(equalTo: payButton.bottomAnchor, constant: 48).isActive = true
        payField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        payField.borderStyle = .roundedRect
        payField.placeholder = "enter card details"
        payDone.backgroundColor = .clear
        payDone.setTitle("ok", for: .normal)
        payDone.backgroundColor = .black
        payDone.layer.cornerRadius = 4
        payDone.topAnchor.constraint(equalTo: payButton.bottomAnchor, constant: 48).isActive = true
        payDone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
    }
    
    var bonus = 0
    private func setupBonusInfo() {
        bonusInfo.translatesAutoresizingMaskIntoConstraints = false
        bonusInfo.text = " you have - \(bonus) bonus, \n 1 bonus = 1 usd".localized()
        bonusInfo.numberOfLines = 0
        bonusInfo.textAlignment = .left
        bonusInfo.font = UIFont(name: "Futura-Bold", size: 24)
        bonusInfo.textColor = .systemBlue
        bonusInfo.bottomAnchor.constraint(equalTo: popularCarTableView.topAnchor, constant: 32).isActive = true
        bonusInfo.topAnchor.constraint(equalTo: payButton.bottomAnchor, constant: 8).isActive = true
        bonusInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        bonusInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    private func setupInfoView() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.bottomAnchor.constraint(equalTo: popularCarTableView.topAnchor, constant: 16).isActive = true
        infoView.topAnchor.constraint(equalTo: payButton.bottomAnchor, constant: 8).isActive = true
        infoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        infoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        infoView.tintColor = .black
        infoView.backgroundColor = .black
    }
        private func setupPopularTableView() {
            let TopConstraint = NSLayoutConstraint(
                item: popularCarTableView,
                attribute: .top,
                relatedBy: .equal,
                toItem: descriptionLabel,
                attribute: .bottom,
                multiplier: 1,
                constant: 260)
            let leadingConstraint = NSLayoutConstraint(
                item: popularCarTableView,
                attribute: .leading,
                relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 0)
            let trailingConstraint = NSLayoutConstraint(
                item: popularCarTableView,
                attribute: .trailing,
                relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1,
            constant: 0)
            let botomConstraint = NSLayoutConstraint(
                item: popularCarTableView,
                attribute: .bottom,
                relatedBy: .equal,
            toItem: tabBarView,
            attribute: .top,
            multiplier: 1,
            constant: 0)
            
            botomConstraint.isActive = true
            trailingConstraint.isActive = true
            TopConstraint.isActive = true
            leadingConstraint.isActive = true
        }
        private func setupTrending() {
                let TopConstraint = NSLayoutConstraint(
                    item: questionButton,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .topMargin,
                    multiplier: 1,
                    constant: 131)
                let leadingConstraint = NSLayoutConstraint(
                    item: questionButton,
                    attribute: .leading,
                    relatedBy: .equal,
                toItem: self,
                attribute: .leading,
                multiplier: 1,
                constant: 245)
                let heightConstraint = NSLayoutConstraint(
                    item: questionButton,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: .none,
                    attribute: .height,
                    multiplier: 1,
                    constant: 37)
                heightConstraint.isActive = true
                let widhtConstraint = NSLayoutConstraint(
                    item: questionButton,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: .none,
                    attribute: .width,
                    multiplier: 1,
                    constant: 80)
                widhtConstraint.isActive = true
            TopConstraint.isActive = true
            leadingConstraint.isActive = true
        }
        private func setupFeatured() {
                let TopConstraint = NSLayoutConstraint(
                    item: bonusButton,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .topMargin,
                    multiplier: 1,
                    constant: 131)
                let leadingConstraint = NSLayoutConstraint(
                    item: bonusButton,
                    attribute: .leading,
                    relatedBy: .equal,
                toItem: self,
                attribute: .leading,
                multiplier: 1,
                constant: 150)
                let heightConstraint = NSLayoutConstraint(
                    item: bonusButton,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: .none,
                    attribute: .height,
                    multiplier: 1,
                    constant: 37)
                heightConstraint.isActive = true
                let widhtConstraint = NSLayoutConstraint(
                    item: bonusButton,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: .none,
                    attribute: .width,
                    multiplier: 1,
                    constant: 80)
                widhtConstraint.isActive = true
            TopConstraint.isActive = true
            leadingConstraint.isActive = true
        }
        private func setupRecent() {
                let TopConstraint = NSLayoutConstraint(
                    item: payButton,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .topMargin,
                    multiplier: 1,
                    constant: 131)
                let leadingConstraint = NSLayoutConstraint(
                    item: payButton,
                    attribute: .leading,
                    relatedBy: .equal,
                toItem: self,
                attribute: .leading,
                multiplier: 1,
                constant: 55)
                let heightConstraint = NSLayoutConstraint(
                    item: payButton,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: .none,
                    attribute: .height,
                    multiplier: 1,
                    constant: 37)
                heightConstraint.isActive = true
                let widhtConstraint = NSLayoutConstraint(
                    item: payButton,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: .none,
                    attribute: .width,
                    multiplier: 1,
                    constant: 80)
                widhtConstraint.isActive = true
            TopConstraint.isActive = true
            leadingConstraint.isActive = true
        }
        
        private func setupTupBar() {
            let TopConstraint = NSLayoutConstraint(
                item: tabBarView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self,
                attribute: .bottom,
                multiplier: 1,
                constant: -34)
            let leadingConstraint = NSLayoutConstraint(
                item: tabBarView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: self,
                attribute: .centerX,
                multiplier: 1,
                constant: 0)
                let heightConstraint = NSLayoutConstraint(
                    item: tabBarView,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: .none,
                    attribute: .height,
                    multiplier: 1,
                    constant: 64)
            let widgtConstraint = NSLayoutConstraint(
                item: tabBarView,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 360)
            
            widgtConstraint.isActive = true
                heightConstraint.isActive = true
            TopConstraint.isActive = true
            leadingConstraint.isActive = true
        }
        
        private func setupUserImageConstraint() {
            let topImage = NSLayoutConstraint(
                               item: exitButton,
                               attribute: .topMargin,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .topMargin,
                               multiplier: 1,
                               constant: 12)
            let trailingImage = NSLayoutConstraint(
                item: exitButton,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: self,
                attribute: .trailing,
                multiplier: 1,
                constant: -16)
            topImage.isActive = true
            trailingImage.isActive = true
        }
            private func setupHeaderLabel() {
            let headertopConstraint = NSLayoutConstraint(
                               item: headerLabel,
                               attribute: .topMargin,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .topMargin,
                               multiplier: 1,
                               constant: 28)
            headertopConstraint.isActive = true

        }
        private func setupDescriptionLabel() {
            let descriptiontopConstraint = NSLayoutConstraint(
                               item: descriptionLabel,
                               attribute: .topMargin,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .topMargin,
                               multiplier: 1,
                               constant: 80)
            let descriptionleadingConstraint = NSLayoutConstraint(
                item: descriptionLabel,
                attribute: .leading,
                relatedBy: .equal,
                toItem: self,
                attribute: .leading,
                multiplier: 1,
                constant: 16)
            let trailingDescription = NSLayoutConstraint(
                item: descriptionLabel,
                attribute: .trailingMargin,
                relatedBy: .equal,
                toItem: self,
                attribute: .trailingMargin,
                multiplier: 1,
                constant: -16)
            trailingDescription.isActive = true
            descriptiontopConstraint.isActive = true
            descriptionleadingConstraint.isActive = true
        }
        
    private func configExitButton() {
    
    exitButton.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
    exitButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
    exitButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    exitButton.layer.cornerRadius = 15
        exitButton.setTitle("   Exit   ".localized(), for: .normal)
    exitButton.titleLabel?.font = UIFont(name: "Roboto", size: 24)
    exitButton.addTarget(self, action: #selector(exitButtonDidTup), for: .touchUpInside)
    }
    
    weak var delegatExit: AuthScreenActionResponsible?
    
@objc private func exitButtonDidTup() {
    delegatExit?.yesButtonDidTup()
    print("exit")
}

        
        private func configureHeader() {
            headerLabel.isUserInteractionEnabled = true
            headerLabel.numberOfLines = 0
            headerLabel.textAlignment = .left
            headerLabel.font = UIFont(name: "Futura", size: 28)
            headerLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
        private func configureDescription() {
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .left
            descriptionLabel.font = UIFont(name: "Futura-Bold", size: 28)
            descriptionLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    //
        private func configureTupBar() {
                tabBarView.backgroundColor = .black
                tabBarView.layer.cornerRadius = 32
            }

    
        private func configureRecentButton() {
            payButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            payButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            payButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            payButton.layer.cornerRadius = 15
            payButton.setTitle("Pay".localized(), for: .normal)
            payButton.titleLabel?.font = UIFont(name: "Roboto", size: 16)
            payButton.addTarget(self, action: #selector(addRecentButtonDidTup), for: .touchUpInside)
        }
        @objc private func addRecentButtonDidTup() {
            setupPayField()
            infoView.isHidden = true
            bonusInfo.isHidden = true
            payDone.isHidden = false
            payField.isHidden = false
            payButton.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
            payButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
            payButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            bonusButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            bonusButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            bonusButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            questionButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            questionButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            questionButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        }
        private func configureFeaturedButton() {
            bonusButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            bonusButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            bonusButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            bonusButton.layer.cornerRadius = 15
            bonusButton.setTitle("Bonus".localized(), for: .normal)
            bonusButton.titleLabel?.font = UIFont(name: "Roboto", size: 16)
            bonusButton.addTarget(self, action: #selector(addFeaturedButtonDidTup), for: .touchUpInside)
        }
        @objc private func addFeaturedButtonDidTup() {
            setupBonusInfo()
            bonusInfo.isHidden = false
            infoView.isHidden = true
            payDone.isHidden = true
            payField.isHidden = true
            bonusButton.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
            bonusButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
            bonusButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
          
            payButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            payButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            payButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            questionButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            questionButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            questionButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        }
        private func configureTrendingButton() {
            questionButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            questionButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            questionButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            questionButton.layer.cornerRadius = 15
            questionButton.setTitle("Questions".localized(), for: .normal)
            questionButton.titleLabel?.font = UIFont(name: "Roboto", size: 16)
            questionButton.addTarget(self, action: #selector(addTrendingButtonDidTup), for: .touchUpInside)
        }
        
        @objc private func addTrendingButtonDidTup() {
            setupInfoView()
            infoView.isHidden = false
            bonusInfo.isHidden = true
            payDone.isHidden = true
            payField.isHidden = true
            questionButton.setTitleColor(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1), for: .normal)
            questionButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), for: .highlighted)
            questionButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
           
            payButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            payButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            payButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            bonusButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1) , for: .normal)
            bonusButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) , for: .highlighted)
            bonusButton.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        }
       
   

}
