//
//  ResturantVM.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/12/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation
struct ResturantVM {
    var resturant: Resturant
    var name: String {
        return resturant.name ?? ""
    }

    var rating: String {
        return resturant.rating ?? ""
    }

    var lat: String {
        return resturant.Ulat ?? ""
    }

    var long: String {
        return resturant.Ulon ?? ""
    }

    static func get(lat: Double, long: Double, completion: @escaping (_ resturant: ResturantVM?, _ error: String?) -> Void) {
        
        var config = NetworkManager.Configuration(parameters: ["uid": "\(lat),\(long)"], url: .resturants, method: .get)
        NetworkManager.makeRequest(configuration: config) {
            (response: APIResponse<Resturant>) in
            guard let resturant = response.data
            else {
                completion(nil, response.message)
                return
            }
            completion(ResturantVM(resturant: resturant), response.message)
        }
    }
}
