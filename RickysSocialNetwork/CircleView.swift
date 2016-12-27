//
//  CircleView.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/26/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //adding a shadow
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        //how far shadow spans out
        layer.shadowRadius = 5.0
        //1 down/up, 1 left/right
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //do the circle config in here becaue the contorller size has now been decided and it will be a more accurate calculation
        layer.cornerRadius = self.frame.width / 2
    }


}
