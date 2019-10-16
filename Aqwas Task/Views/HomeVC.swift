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
    @IBOutlet weak var vwTop: UIView!
    
    @IBOutlet weak var vwOptions: OptionsView!
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
    
    @IBOutlet weak var constHeightVwTop: NSLayoutConstraint!
    
    var menuView: SideMenuView!
    var menuExpanded : Bool =  false
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
        intiSideMenu()
    }
    
    func intiSideMenu(){
        guard let menu = Bundle.main.loadNibNamed("SideMenuView", owner: self, options: nil)![0] as? SideMenuView else { return }
        self.menuView = menu
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
    
    func animateToTop() {
        constCenterHorizotalImgLogoToContainer.minPriority()
        constCenterHorizotalLblTitleToContainer.minPriority()
        constCenterVerticalImgLogoToContainer.minPriority()
        constTopLblTitleToLogo.minPriority()
        constWidthImgLogo.minPriority()
        constHeightImgLogo.minPriority()
        
        lblTitle.font = UIFont.systemFont(ofSize: 25)
        
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
    
    func initializeLoader() {
        vwLoader.type = .ballPulse
        vwLoader.backgroundColor = UIColor.white
        vwLoader.color = UIColor(hexString: "#33536A")
    }
    
    @IBAction func btnSearch_Click(_ sender: UIButton) {
        getResturant()
        //location.startLocationTracking(initializing: false)
        vwOptions.btnLike.tintColor = UIColor(hexString: "#797779")
        animateLoader()
        if view.backgroundColor == UIColor.white {
            lblTitle.animate(font: UIFont.systemFont(ofSize: 33), duration: 0.4)
            lblTitle.animate(font: UIFont.systemFont(ofSize: 25), duration: 0.4)
        }
        
    }
    
    func getResturant() {
        guard let lat = LocationManager.currentLocation?.coordinate.latitude, let long = LocationManager.currentLocation?.coordinate.longitude else { return }
        ResturantVM.get(lat: lat, long: long) { resturant, error in
            self.vwLoader.stopAnimating()
            if error != nil {
                self.animateAfterSearch()
                self.alert(message: error!, title: "Failed", buttonMessage: "OK")
                return
            }
            guard let resturant = resturant else { return }
            self.resturant = resturant
            self.vwOptions.bindData(resturant: resturant)
            self.bindMapData()
            print(resturant)
            self.animateAfterSearch()
        }
    }

    func bindMapData() {
        for annotation in self.mapView.annotations {
            self.mapView.removeAnnotation(annotation)
        }
        guard let resturant = resturant else { return }
        
        let center = CLLocationCoordinate2D(latitude: resturant.lat, longitude: resturant.long)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        //mapView.delegate = self
        mapView.setRegion(region, animated: true)
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = center
        mapView.addAnnotation(myAnnotation)
//            UIView.animate(withDuration: 1.0) { [weak self] in
//                self!.view.layoutIfNeeded()
//            }
    }

    @IBAction func btnMenu_Click(_ sender: UIButton) {
        toggleSideMenu()
    }
    
    func toggleSideMenu() {
        transformSideMenuBtn()
        if menuExpanded {
            self.menuExpanded = false
            hideShowBtnsAndView(show: false)
            self.menuView.removeFromSuperview()
            constHeightVwTop.constant = 85
            
        } else {
            self.menuExpanded = true
            hideShowBtnsAndView(show: true)
            constHeightVwTop.constant = view.frame.height
            menuView.center = self.vwTop.center
            self.vwTop.addSubview(menuView)
        }
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.layoutIfNeeded() ?? ()
        }
    }
    func hideShowBtnsAndView(show: Bool) {
        btnSearch.isHidden = show
        btnSettings.isHidden = show
        vwOptions.isHidden = show
    }
    func transformSideMenuBtn() {
        UIView.animate(withDuration: 0.5, animations: {
            self.btnMenu.transform = self.btnMenu.transform.rotated(by: CGFloat(Double.pi))
            if self.btnMenu.imageView?.image == UIImage(named: "close") {
                self.btnMenu.setImage(UIImage(named: "menu"), for: .normal)
            }
            else {
                self.btnMenu.setImage(UIImage(named: "close"), for: .normal)
            }
        })
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

