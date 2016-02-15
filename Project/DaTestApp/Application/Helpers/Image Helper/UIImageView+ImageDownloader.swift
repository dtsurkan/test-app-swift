//
//  UIImage+ImageDownloader.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

extension UIImageView {

    func setupImage(fromURL url: String) {
        ImageDownloaderHelper.download(image: url) { (image) -> () in
            self.image = image
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }

}
