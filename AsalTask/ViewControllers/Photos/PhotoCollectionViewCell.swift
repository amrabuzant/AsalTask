//
//  PhotoCollectionViewCell.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? = nil
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    func setUpCell(_ photo: Photo){
        self.photo = photo
        thumbImageView.sd_setImage(with: URL(string: photo.thumbnailUrl))
        photoTitleLabel.text = photo.title
    }
}
