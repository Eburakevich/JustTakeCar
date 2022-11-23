//
//  CGFloat.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 16.09.22.
//


import CoreGraphics

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
    assert(min < max)
    return CGFloat.random() * (max - min) + min
    }
}
