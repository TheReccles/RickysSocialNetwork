//
//  FancyField.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/25/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //add customer border
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        //set new bounds, this will impact placeholder text
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        //set bounds, this will impace the editing text
        return bounds.insetBy(dx: 10, dy: 5)
    }

    
}
