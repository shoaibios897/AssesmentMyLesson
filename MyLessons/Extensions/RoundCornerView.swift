//
//  RoundCornerView.swift
//  MyLessons
//
//  Created by Apple on 28/09/2021.
//

import UIKit

class RoundCornerView: UIView {
    /* CORNER RADIUS */
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    
    
    
    
}
