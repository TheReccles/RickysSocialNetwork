//
//  RoundBtn.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/25/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //adding a shadow
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        //how far shadow spans out
        layer.shadowRadius = 5.0
        //1 down/up, 1 left/right
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        //scale your image on the button
        imageView?.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //do the circle config in here becaue the contorller size has now been decided and it will be a more accurate calculation
        layer.cornerRadius = self.frame.width / 2
    }

}
