//
//  ImageDownloaderHelper.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit
import AlamofireImage

class ImageDownloaderHelper: NSObject {
    private static let imageDownloader = ImageDownloader(
    configuration: ImageDownloader.defaultURLSessionConfiguration(),
            downloadPrioritization: .FIFO,
            maximumActiveDownloads: 10,
            imageCache: AutoPurgingImageCache()
    )

    class func download(image imageURL: String, success: (image:UIImage) -> ()) {
        guard let url = NSURL(string: imageURL) else {
            return
        }
        
        let request = NSURLRequest(URL:url)
        imageDownloader.downloadImage(URLRequest: request, completion: {
            (response) -> Void in
            if let image = response.result.value {
                success(image: image)
            }
        })
    }
}
