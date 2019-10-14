//
//  ImagePreviewVC.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/14/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class ImagePreviewVC: UIViewController {
    @IBOutlet var img: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = image
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view == img {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
