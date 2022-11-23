//
//  MapView.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 22.07.22.
//

import UIKit
import MapKit

class MapView: UIView {
   
    
    init(map: MapView) {
        self.map = map
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    let map: MapView 
    
    override init(frame: CGRect) {

        addSubview(map)
        
        map.translatesAutoresizingMaskIntoConstraints = false
       
        setupConstraints()
       
    }
   
    
    private func setupConstraints() {
    map.topAnchor.constraint(equalTo: topAnchor, constant: 64).isActive = true
    map.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        map.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        map.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 64).isActive = true
        
        
       
        
    }
    

}
