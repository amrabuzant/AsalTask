//
//  photo.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import Foundation

@objc class Photo: NSObject, Codable {
    @objc let albumId: Int
    @objc let id: Int
    @objc let title: String
    @objc let url: String
    @objc let thumbnailUrl: String
}
