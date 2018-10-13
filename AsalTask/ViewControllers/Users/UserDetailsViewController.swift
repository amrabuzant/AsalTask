//
//  UserDetailsViewController.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import UIKit
import MapKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var geoMapView: MKMapView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var comNameLabel: UILabel!
    @IBOutlet weak var comCatchPheaseLabel: UILabel!
    @IBOutlet weak var comBSLabel: UILabel!
    
    var userInfo : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let Data = userInfo {
            LoadInfo(Data)
        }
    }
    
    func LoadInfo(_ user: User) {
        self.title = user.name
        
        idLabel.text = "\(user.id)"
        nameLabel.text = user.name
        userNameLabel.text = user.username
        emailLabel.text = user.email
        addressLabel.text = user.address.suite + " / " + user.address.street + " / " + user.address.city
        zipCodeLabel.text = user.address.zipcode
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
        comNameLabel.text = user.company.name
        comCatchPheaseLabel.text = user.company.catchPhrase
        comBSLabel.text = user.company.bs
        
        let annotation = MKPointAnnotation()
        let userLocation = CLLocationCoordinate2D(latitude: Double(user.address.geo.lat)!, longitude: Double(user.address.geo.lng)!)
        annotation.coordinate = userLocation
        annotation.title = "\(user.username) Location"
        geoMapView.addAnnotation(annotation)
        geoMapView.setCenter(userLocation, animated: false)
        
    }

}
