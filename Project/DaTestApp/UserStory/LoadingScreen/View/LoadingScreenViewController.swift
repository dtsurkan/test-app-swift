//
//  LoadingScreenViewController.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 08/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

class LoadingScreenViewController: UIViewController, LoadingScreenViewInput {
    weak var output: LoadingScreenViewOutput!

    @IBOutlet weak var animationImageView: UIImageView!

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    //MARK: - LoadingScreenViewInput

    func animateLoading() {
        animationImageView.animationImages = animationImages()
        animationImageView.animationDuration = 0.5
        animationImageView.startAnimating()
    }

    func stopAnimating() {
        animationImageView.stopAnimating()
    }

    func controller() -> UIViewController {
        return self
    }

    //MARK: Private

    func animationImages() -> [UIImage]? {
        var result = [UIImage]()
        for index in 1 ... 6 {
            let imageName = "act\(index).png";
            if let image = UIImage(named: imageName) {
                result.append(image)
            }

        }
        return result
    }

}
