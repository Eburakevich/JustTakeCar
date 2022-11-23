//
//  FirstVC.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 12.07.22.
//

import Foundation

import UIKit

class FirstStartCarViewController: UIViewController {
    
    
    private let firstView = StartCarView()
    override func loadView() {
        super.loadView()
       
                
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = firstView
        firstView.welcomLabel.text = ""
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000)) {
            
           
            self.navigationController?.pushViewController(WelcomViewController(), animated: true)
            self.navigationController?.viewControllers.remove(at: .zero)
           
            
        }
        
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

