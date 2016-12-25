//
//  FancyBtn.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/25/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit

class FancyBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //adding a shadow
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        //how far shadow spans out
        layer.shadowRadius = 5.0
        //1 down/up, 1 left/right
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //dont have to calculate image bounds, so we can do in awake from nib
        layer.cornerRadius = 2.0
    }

}
