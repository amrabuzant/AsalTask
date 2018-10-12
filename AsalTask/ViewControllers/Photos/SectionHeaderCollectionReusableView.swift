//
//  SectionHeaderCollectionReusableView.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import UIKit

class SectionHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headerLabel: UILabel!
    
    func setUpHeader(_ id:Int){
        headerLabel.text = "Album ID : \(id)"
    }
}
