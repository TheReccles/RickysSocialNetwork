//
//  CircleView.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/26/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        //do the circle config in here becaue the contorller size has now been decided and it will be a more accurate calculation
        layer.cornerRadius = self.frame.width / 2
    }

}
