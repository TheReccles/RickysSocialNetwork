//
//  PostCell.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/26/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //keep UIImage optional because we mayh be getting image from cache instead of redownloading, if you do not get image pass in nil
    func configureCell(post: Post, img: UIImage? = nil) {
        self.post = post
        self.caption.text = post.caption
        self.likesLbl.text = "\(post.likes)"
        
        
        if img != nil {
            self.postImg.image = img
        }
        else {
            //if we dont have it in the cache then actually download it
            let ref = FIRStorage.storage().reference(forURL: post.imageUrl)
            //maximum size of the image
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print("Ricky: Unable to download image from Firebase Storage")
                }
                else {
                    print("Ricky: Image downloaded from Firebase Storage")
                    //save data to cache
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.postImg.image = img
                            //forKey will always be imageURL bc it is unique
                            FeedVC.imageCache.setObject(img, forKey: post.imageUrl as NSString)
                            
                        }
                    }
                }
            })
        }
    }



}
