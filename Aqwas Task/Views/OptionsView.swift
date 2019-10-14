//
//  OptionsView.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/14/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher
class OptionsView: UIView {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    
    var resturant: ResturantVM?

    @IBAction func btnMap_Click(_ sender: UIButton) {
        guard let resturant = resturant else { return }
        let latitude: CLLocationDegrees = resturant.lat
        let longitude: CLLocationDegrees = resturant.long

        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = resturant.name
        mapItem.openInMaps(launchOptions: options)
    }
    @IBAction func btnShare_Click(_ sender: UIButton) {
        guard let resturant = resturant else { return }
        let link = resturant.link
        if let linkAsUrl = URL(string: link) {
            let objectsToShare = ["", linkAsUrl] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = UIApplication.topViewController()!.view
            activityVC.completionWithItemsHandler = { activity, success, _, _ in
                if !success {
                    print("cancelled")
                    return
                }
            }
            UIApplication.topViewController()!.present(activityVC, animated: true, completion: nil)
        }
    }
    @IBAction func btnLike_Click(_ sender: UIButton) {
        btnLike.tintColor = UIColor.red

    }
    @IBAction func btnGallery_Click(_ sender: UIButton) {
        downloadImage(url: resturant?.image ?? "") { img in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyBoard.instantiateViewController(withIdentifier: "ImagePreviewVC") as! ImagePreviewVC
            nextVC.image = img
            UIApplication.topViewController()!.present(nextVC, animated: true, completion: nil)
        }
    }
    @IBAction func btnDetails_Click(_ sender: UIButton) {
        UIApplication.topViewController()!.alert(message: "\(resturant?.name ?? "") is a \(resturant?.category ?? "") resturant with \(resturant?.rating ?? "0")/ rating")
    }
    
    func bindData(resturant: ResturantVM) {
        self.resturant = resturant
        lblTitle.text = resturant.name
        lblCategory.text = resturant.category
        lblRating.text = resturant.rating
    }
    
    func downloadImage(url: String, completion: @escaping (_ image: UIImage) -> Void) {
        guard let url = URL(string: url) else {completion(UIImage(named:"place_holder")!)
            return
            
        }
        KingfisherManager.shared.retrieveImage(with: url) {
            result in
            switch result {
            case let .success(value):
                completion(value.image)
            case let .failure(error):
                print(error)
                completion(UIImage(named:"place_holder")!)
            }
        }
    }
}
