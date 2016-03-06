//
//  PhotoCell.swift
//  InstagramSG
//
//  Created by Sukhrobjon Golibboev on 3/5/16.
//  Copyright © 2016 ccsf. All rights reserved.
//

import UIKit
import Parse

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    
    var object: PFObject? {
        didSet {
            photo = Photo(object: object!)
            photo.cell = self
            
        }
    }
    
    
    
    
    var photo: Photo! {
        didSet{
            print("Rasm qoyildimi?")
            photoView.image = photo.image
            print("Shu rasm qoyildi: \(photo.image)")
            captionLabel.text = photo.caption
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
