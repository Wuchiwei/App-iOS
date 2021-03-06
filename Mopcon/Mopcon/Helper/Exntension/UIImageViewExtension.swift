//
//  DownloadImage.swift
//  Mopcon
//
//  Created by JeremyXue on 2018/8/14.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
    
    // Get URL Image
    func getImage(address:String) {
        
        if let imageUrl = URL(string: address) {
            DispatchQueue.global().async {
                do {
                    let imageData = try Data(contentsOf: imageUrl)
                    let downloadImage = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        self.image = downloadImage
                    }
                } catch {
                    print("Can't download this image.")
                }
            }
        } else {
            print("Invalid URL.")
        }
        
    }
    
    // Make Circle Image
    func makeCircle() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
