//
//  users.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoLocation

}

struct GeoLocation: Codable {
    let lat: Double
    let lng: Double

}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
