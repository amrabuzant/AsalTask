//
//  FullPhotoViewController.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/13/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import UIKit
import SDWebImage

class FullPhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo : Photo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = photo {
            loadPhoto(photo: data)
        }
    }
    
    func loadPhoto(photo : Photo){
        photoImageView.sd_setImage(with: URL(string: photo.url))
        self.title = photo.title
    }

}
