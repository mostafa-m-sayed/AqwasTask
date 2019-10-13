//
//  HomeVC.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/11/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import MapKit
class HomeVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var vwLoader: NVActivityIndicatorView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnMenu: UIButton!
    
    @IBOutlet weak var vwOptions: UIView!
    //MARK: Logo Constraints
    @IBOutlet weak var constCenterVerticalImgLogoToContainer: NSLayoutConstraint!

    //MARK: Title Constraints
    @IBOutlet weak var constTopLblTitleToLogo: NSLayoutConstraint!
    @IBOutlet weak var constBottomLblTitleToContainer: NSLayoutConstraint!

    //MARK: Settings Button Constraints
    @IBOutlet weak var constLeadingBtnSettingsToContainer: NSLayoutConstraint!
    @IBOutlet weak var constLeadingBtnSettingsToLblTitle: NSLayoutConstraint!
    @IBOutlet weak var constBottomBtnSettingsToContainer: NSLayoutConstraint!

    //MARK: Search Button Constraints
    @IBOutlet weak var constTopBtnSearchToLblTitle: NSLayoutConstraint!
    @IBOutlet weak var constTrailingBtnSearchToLblTitle: NSLayoutConstraint!
    @IBOutlet weak var constTrailingBtnSearchToContainer: NSLayoutConstraint!
    @IBOutlet weak var constBottomBtnSearchToContainer: NSLayoutConstraint!
    
    //MARK: Loader Constraints
    @IBOutlet weak var constWidthVwLoader: NSLayoutConstraint!
    @IBOutlet weak var constLeadingVwLoaderToBtnSettings: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var constWidthImgLogoTop: NSLayoutConstraint!
    @IBOutlet weak var constWidthImgLogo: NSLayoutConstraint!
    @IBOutlet weak var constHeightImgLogoTop: NSLayoutConstraint!
    @IBOutlet weak var constHeightImgLogo: NSLayoutConstraint!
    
    @IBOutlet weak var constWidthLblTitleTop: NSLayoutConstraint!
    @IBOutlet weak var constHeightLblTitleTop: NSLayoutConstraint!
    
    @IBOutlet weak var constCenterVerticalImgLogoToLblTitleTop: NSLayoutConstraint!
    @IBOutlet weak var constLeadingImgLogoToLblTitleTop: NSLayoutConstraint!
    @IBOutlet weak var constTopLblTitleToContainerTop: NSLayoutConstraint!
    @IBOutlet weak var constCenterHorizontalLblTitleToContainerTop: NSLayoutConstraint!
    
    @IBOutlet weak var constCenterHorizotalLblTitleToContainer: NSLayoutConstraint!
    @IBOutlet weak var constCenterHorizotalImgLogoToContainer: NSLayoutConstraint!
    
    @IBOutlet weak var constTrailingBtnSearchToVwHiddenBot: NSLayoutConstraint!
    @IBOutlet weak var constLeadingBtnSettingsToVwHiddenBot: NSLayoutConstraint!
    @IBOutlet weak var constWidthBtnSearchToVwHiddenBot: NSLayoutConstraint!
    @IBOutlet weak var constWidthBtnSettingsToVwHiddenBot: NSLayoutConstraint!
    @IBOutlet weak var constWidthBtnSearchToLblTitle: NSLayoutConstraint!
    @IBOutlet weak var constWidthBtnSettingsToLblTitle: NSLayoutConstraint!
    @IBOutlet weak var constCenterVerticalBtnSearchToVwHidden: NSLayoutConstraint!
    
    @IBOutlet weak var constTopVwTopToContainer: NSLayoutConstraint!
    
    @IBOutlet weak var constLeadingVwLoaderToVwHidden: NSLayoutConstraint!
    @IBOutlet weak var constTrailingVwLoaderToVwHidden: NSLayoutConstraint!
    @IBOutlet weak var constTopVwLoaderToVwHidden: NSLayoutConstraint!
    @IBOutlet weak var constBottomVwLoaderToVwHidden: NSLayoutConstraint!
    
    @IBOutlet weak var constTopVwLoaderToLblTitle: NSLayoutConstraint!
    @IBOutlet weak var constTrailingVwLoaderToLblTitle: NSLayoutConstraint!
    
    func animateToTop() {
        constCenterHorizotalImgLogoToContainer.minPriority()
        constCenterHorizotalLblTitleToContainer.minPriority()
        constCenterVerticalImgLogoToContainer.minPriority()
        constTopLblTitleToLogo.minPriority()
        constWidthImgLogo.minPriority()
        constHeightImgLogo.minPriority()
        
        lblTitle.font = UIFont(name: "system", size: 25)
        
        constCenterVerticalImgLogoToLblTitleTop.maxPriority()
        constLeadingImgLogoToLblTitleTop.maxPriority()
        constTopLblTitleToContainerTop.maxPriority()
        constCenterHorizontalLblTitleToContainerTop.maxPriority()
        constHeightImgLogoTop.maxPriority()
        constWidthImgLogoTop.maxPriority()
//        constWidthLblTitleTop.maxPriority()
//        constHeightLblTitleTop.maxPriority()
        constTopVwTopToContainer.constant = 0
        self.view.backgroundColor = UIColor.white
        mapView.alpha = 1
        vwOptions.isHidden = false
    }
    func animateToBottom() {
        btnSearch.isHidden = false
        btnSettings.isHidden = false
        vwLoader.isHidden = true
        constWidthBtnSearchToLblTitle.minPriority()
        constWidthBtnSettingsToLblTitle.minPriority()
        constTopBtnSearchToLblTitle.minPriority()
        constTrailingBtnSearchToLblTitle.minPriority()
        constLeadingBtnSettingsToLblTitle.minPriority()
        
        
        constTrailingBtnSearchToVwHiddenBot.maxPriority()
        constLeadingBtnSettingsToVwHiddenBot.maxPriority()
        constWidthBtnSearchToVwHiddenBot.maxPriority()
        constWidthBtnSettingsToVwHiddenBot.maxPriority()
        constCenterVerticalBtnSearchToVwHidden.maxPriority()
        
              
        constLeadingVwLoaderToVwHidden.maxPriority()
        constTrailingVwLoaderToVwHidden.maxPriority()
        constTopVwLoaderToVwHidden.maxPriority()
        constBottomVwLoaderToVwHidden.maxPriority()
        
        constLeadingVwLoaderToBtnSettings.minPriority()
        constWidthVwLoader.minPriority()
        constTopVwLoaderToLblTitle.minPriority()
        constTrailingVwLoaderToLblTitle.minPriority()
        
        changeButtonsColors()
        
    }
    func changeButtonsColors() {
        btnSettings.backgroundColor =  UIColor(hexString: "#468C96")
        btnSearch.backgroundColor =  UIColor(hexString: "#468C96")

        btnSettings.setTitleColor(UIColor.white, for: .normal)
        btnSearch.setTitleColor(UIColor.white, for: .normal)
        btnSettings.tintColor = UIColor.white
    }
    func animateAfterSearch() {
        animateToTop()
        animateToBottom()
        UIView.animate(withDuration: 1) { [weak self] in
            self?.view.layoutIfNeeded() ?? ()
        }
    }
    
    let location = LocationManager()
    var resturant: ResturantVM?

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLoader()
        location.delegate = self
        location.startLocationTracking(initializing: true)
    }

    override func viewWillAppear(_ animate: Bool) {
        super.viewWillAppear(animate)
        btnSettings.imageView?.contentMode = .scaleAspectFit
        btnMenu.imageView?.contentMode = .scaleAspectFit
        startAnimation()
    }

    //MARK: Animation Handling
    
    func startAnimation() {
        animateLogo()
        animateTitle()
        animateBtnSearch()
        animateBtnSettings()
        UIView.animate(withDuration: 1.5) { [weak self] in
            self?.view.layoutIfNeeded() ?? ()
        }
    }

    func animateBtnSettings() {
        constLeadingBtnSettingsToContainer.minPriority()
        constLeadingBtnSettingsToLblTitle.maxPriority()
        constBottomBtnSettingsToContainer.minPriority()
    }

    func animateBtnSearch() {
        constTopBtnSearchToLblTitle.maxPriority()
        constTrailingBtnSearchToLblTitle.maxPriority()
        constBottomBtnSearchToContainer.minPriority()
        constTrailingBtnSearchToContainer.minPriority()
    }

    func animateLogo() {
        constCenterVerticalImgLogoToContainer.constant = -20
    }

    func animateTitle() {
        constTopLblTitleToLogo.maxPriority()
        constBottomLblTitleToContainer.minPriority()
    }

    func animateLoader() {
        vwLoader.isHidden = false
        btnSearch.isHidden = true
        btnSettings.isHidden = true
        constCenterVerticalImgLogoToContainer.constant = -40
        constWidthVwLoader.minPriority()
        constLeadingVwLoaderToBtnSettings.maxPriority()
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.layoutIfNeeded() ?? ()
        }
        vwLoader.startAnimating()
    }

    func initializeLoader() {
        vwLoader.type = .ballPulse
        vwLoader.backgroundColor = UIColor.white
        vwLoader.color = UIColor(hexString: "#33536A")
    }

    @IBAction func btnSearch_Click(_ sender: UIButton) {
        location.startLocationTracking(initializing: false)
        animateLoader()
    }

    func getResturant() {
        self.animateAfterSearch()
//        guard let lat = LocationManager.currentLocation?.coordinate.latitude, let long = LocationManager.currentLocation?.coordinate.longitude else { return }
//        ResturantVM.get(lat: lat, long: long) { resturant, error in
//            self.vwLoader.stopAnimating()
//            if error != nil {
//                self.alert(message: error!, title: "Failed", buttonMessage: "OK")
//                return
//            }
//            guard let resturant = resturant else { return }
//            print(resturant)
//            self.animateToTop()
//        }
    }

}

extension HomeVC: LocationUpdated {
    func didUpdateLocation(initializing: Bool) {
        setMapCenter()
        if !initializing {
            getResturant()
        }
    }
}

extension HomeVC {
    func setMapCenter() {
        guard let lat = LocationManager.currentLocation?.coordinate.latitude, let long = LocationManager.currentLocation?.coordinate.longitude else { return }
        let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
    }
}
extension NSLayoutConstraint {
    func minPriority() {
        self.priority = UILayoutPriority(rawValue: 1)
    }
    func maxPriority() {
        self.priority = UILayoutPriority(rawValue: 1000)
    }
}
