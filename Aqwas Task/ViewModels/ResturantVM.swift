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
        return "\(resturant.rating ?? "")/10"
    }

    var lat: Double {
        return Double(resturant.lat ?? "") ?? 0
    }

    var long: Double {
        return Double(resturant.lon ?? "") ?? 0
    }

    var category: String {
        return resturant.cat ?? ""
    }

    var link: String {
        return resturant.link ?? ""
    }

    var image: String {
        if resturant.image != nil, resturant.image!.count > 0 {
            return resturant.image![0]
        }
        return  ""
    }

    static func get(lat: Double, long: Double, completion: @escaping (_ resturant: ResturantVM?, _ error: String?) -> Void) {
        
        let config = NetworkManager.Configuration(parameters: ["uid": "\(lat),\(long)"], url: .resturants, method: .get)
        NetworkManager.makeRequest(configuration: config) {
            (response: APIResponse<Resturant>) in
            guard let rawResponse = NetworkManager.rawResponse else { return }
            guard let resturant: Resturant = rawResponse.getObject() else {
                completion(nil, response.message)
                return
            }
            completion(ResturantVM(resturant: resturant), response.message)
        }
    }
}
