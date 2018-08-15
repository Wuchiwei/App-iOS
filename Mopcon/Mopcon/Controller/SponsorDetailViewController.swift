//
//  SponsorDetailViewController.swift
//  Mopcon
//
//  Created by EthanLin on 2018/7/4.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

enum SponsorCellStyle {
    case sponsor
    case info
    case seeMore
}

class SponsorDetailViewController: UIViewController {
    
    var sponsor: Sponsor.Payload?
    
    @IBOutlet weak var sponsorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        sponsorsTableView.dataSource = self
        sponsorsTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SponsorDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellidentifer = ""
        
        
        switch indexPath.row {
        case SponsorCellStyle.sponsor.hashValue:
            cellidentifer = SponsorTableViewCellID.sponsorCell
        case SponsorCellStyle.info.hashValue:
            cellidentifer = SponsorTableViewCellID.sponsorInfoCell
        default:
            cellidentifer = SponsorTableViewCellID.seeMoreCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifer, for: indexPath)
        if let sponsor = sponsor {
            // Get sponsor Data
            if let sponsorImageView = cell.viewWithTag(0) as? UIImageView {
                sponsorImageView.getImage(address: sponsor.logo)
            }
            
            if let sponsorNameLabel = cell.viewWithTag(1) as? UILabel {
                sponsorNameLabel.text = sponsor.name
            }
            
            if let sponsorInfoLabel = cell.viewWithTag(2) as? UILabel {
                sponsorInfoLabel.text = sponsor.info
            }

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 244
        case 1:
            return UITableViewAutomaticDimension
        default:
            return 70
        }
    }
    
    
}
