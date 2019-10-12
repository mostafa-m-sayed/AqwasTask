//
//  HomeVC.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/11/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animate: Bool) {
        super.viewWillAppear(animate)
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
        constLeadingBtnSettingsToContainer.priority = UILayoutPriority(rawValue: 1)
        constLeadingBtnSettingsToLblTitle.priority = UILayoutPriority(rawValue: 1000)
        constBottomBtnSettingsToContainer.priority = UILayoutPriority(rawValue: 1)
    }

    func animateBtnSearch() {
        constTopBtnSearchToLblTitle.priority = UILayoutPriority(rawValue: 1000)
        constTrailingBtnSearchToLblTitle.priority = UILayoutPriority(rawValue: 1000)
        constBottomBtnSearchToContainer.priority = UILayoutPriority(rawValue: 1)
        constTrailingBtnSearchToContainer.priority = UILayoutPriority(rawValue: 1)
    }

    func animateLogo() {
        constCenterVerticalImgLogoToContainer.constant = -20
    }

    func animateTitle() {
        constTopLblTitleToLogo.priority = UILayoutPriority(rawValue: 1000)
        constBottomLblTitleToContainer.priority = UILayoutPriority(rawValue: 1)
    }
}

