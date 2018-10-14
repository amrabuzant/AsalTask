//
//  users.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import Foundation

@objc class User: NSObject, Codable {
    @objc let id: Int
    @objc let name: String
    @objc let username: String
    @objc let email: String
    @objc let address: Address
    @objc let phone: String
    @objc let website: String
    @objc let company: Company
}

@objc class Address: NSObject, Codable {
    @objc let street: String
    @objc let suite: String
    @objc let city: String
    @objc let zipcode: String
    @objc let geo: GeoLocation

}

@objc class GeoLocation: NSObject, Codable {
    @objc let lat: String
    @objc let lng: String

}

@objc class Company: NSObject, Codable {
    @objc let name: String
    @objc let catchPhrase: String
    @objc let bs: String
}
