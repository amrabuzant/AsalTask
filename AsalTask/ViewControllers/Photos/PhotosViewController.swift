//
//  PhotosViewController.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellIdentifier = "PhotoCell"
    let headerIdentifier = "SectionHeader"
    
    var dataSource : [(key: Int, value: [Photo])] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Photos"
        
        loadPhotos()
    }
    

    func loadPhotos(){
        APIMethods.getPhotos {[weak self] (data, error) in
            if error == nil {
                var tempDic : [Int:[Photo]] = [:]
                data?.forEach({ (item) in
                    let arr = tempDic[item.albumId]
                    tempDic[item.albumId] = arr == nil ?  [item] : arr!+[item]
                })
                self?.dataSource = Array(tempDic)
            } else {
                debugPrint(error!)
            }
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destinationVC = segue.destination as? FullPhotoViewController{
            if let cell = sender as? PhotoCollectionViewCell{
                destinationVC.photo = cell.photo
            }
        }
    }
 

}

extension PhotosViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PhotoCollectionViewCell  else {
            fatalError("The dequeued cell is not an instance of PhotoCollectionViewCell.")
        }
        
        let photo = dataSource[indexPath.section].value[indexPath.row]
        cell.setUpCell(photo)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as? SectionHeaderCollectionReusableView else {
            fatalError("The dequeued HeaderView is not an instance of SectionHeaderCollectionReusableView.")
        }
        
        header.setUpHeader(dataSource[indexPath.section].key)
        
        return header
    }
    
}
