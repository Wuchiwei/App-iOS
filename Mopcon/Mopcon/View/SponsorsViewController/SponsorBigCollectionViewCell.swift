//
//  SponsorBigCollectionViewCell.swift
//  Mopcon
//
//  Created by EthanLin on 2018/7/4.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class SponsorBigCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sponsorBigImageView: UIImageView!
    func updateUI(imageName:String){
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        sponsorBigImageView.image = UIImage(named: imageName)
    }
}