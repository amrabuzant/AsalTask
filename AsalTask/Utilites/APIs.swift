//
//  APIs.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import Foundation
import Alamofire


class APINames {
    static let SERVER = "https://jsonplaceholder.typicode.com/"
    
    static let Users = SERVER + "users"
    static let Photos = SERVER + "photos"
    
    
}


@objc class APIMethods : NSObject {
    
    @objc static func getUsers(completion: @escaping (_ data: [User]?, _ error: String?) -> Void) {
        Alamofire.request(APINames.Users).validate().responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode([User].self, from: response.data!)

                    completion(responseModel,"0")
                    
                } catch let error as NSError {
                    completion(nil, error.description)
                }
            case .failure(let error):
                completion(nil,error.localizedDescription)
            }
        }
    }
    
    @objc static func getPhotos(completion: @escaping (_ data: [Photo]?, _ error: String?) -> Void) {
        Alamofire.request(APINames.Photos).validate().responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode([Photo].self, from: response.data!)
                   
                    completion(responseModel,"0")
                    
                } catch let error as NSError {
                    completion(nil, error.description)
                }
            case .failure(let error):
                completion(nil,error.localizedDescription)
            }
        }
    }
    
}
