//
//  Photo.swift
//  InstagramSG
//
//  Created by Sukhrobjon Golibboev on 3/5/16.
//  Copyright © 2016 ccsf. All rights reserved.
//

import UIKit
import Parse

let imageDataSetNotification = "imageDataSet";


class Photo: NSObject {

    
    var image: UIImage?
    var author: PFUser?
    var caption: String?
    var likesCount: Int?
    var commentsCount: Int?
    
    var cell: PhotoCell?
    
    init(object: PFObject) {
        
        super.init()
        
        let newObject = object
        
        print("Get Rasm dettalariga from object ")
        caption = newObject["caption"] as! String
        likesCount = newObject["likesCount"] as! Int
        commentsCount = newObject["commentsCount"] as! Int
        
        
        if let newImage = object.valueForKey("media")! as? PFFile {
            
            newImage.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    print("Image data found Saving UIimage")
                    let image = UIImage(data: imageData!)
                    print(image)
                    self.image = image
                    self.cell?.photo = self;
                    NSNotificationCenter.defaultCenter().postNotificationName(imageDataSetNotification, object: nil)
                }else{
                    print("ERROR: could not get image \(error?.localizedDescription)")
                    
                }
                }, progressBlock: { (int: Int32) -> Void in
                    print("onikay")
            })
        }
        
    }
    

}
