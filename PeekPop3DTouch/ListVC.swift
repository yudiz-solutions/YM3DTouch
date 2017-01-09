//
//  ListVC.swift
//  PeekPop3DTouch
//
//  Created by Yudiz Solutions Pvt.Ltd. on 04/01/17.
//  Copyright © 2017 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var tblList: UITableView!
    
    var arrCompany = [Company]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrCompany.append(
            Company(name:"Apple",
                    address:"Cupertino, California, U.S.",
                    url:"https://en.wikipedia.org/wiki/Apple_Inc",
                    logo:#imageLiteral(resourceName: "apple"))
        )
        
        arrCompany.append(
            Company(name:"Google",
                    address:"Googleplex, Mountain View, California, U.S",
                    url:"https://en.wikipedia.org/wiki/Google",
                    logo:#imageLiteral(resourceName: "google"))
        )
        
        arrCompany.append(
            Company(name:"Microsoft",
                    address:"Albuquerque, New Mexico, United States",
                    url:"https://en.wikipedia.org/wiki/Microsoft",
                    logo:#imageLiteral(resourceName: "microsoft"))
        )
        
        arrCompany.append(
            Company(name:"Samsung",
                    address:"Seocho District, Seoul, South Korea",
                    url:"https://en.wikipedia.org/wiki/Samsung",
                    logo:#imageLiteral(resourceName: "samsung"))
        )
        
        arrCompany.append(
            Company(name:"Amazon",
                    address:"Seattle, Washington, U.S",
                    url:"https://en.wikipedia.org/wiki/Amazon.com",
                    logo:#imageLiteral(resourceName: "amazon"))
        )
        
        arrCompany.append(
            Company(name:"Facebook",
                    address:"Menlo Park, California, U.S.",
                    url:"https://en.wikipedia.org/wiki/Facebook",
                    logo:#imageLiteral(resourceName: "facebook"))
        )
        
        arrCompany.append(
            Company(name:"Flipkart",
                    address:"Bangalore, Karnataka, India",
                    url:"https://en.wikipedia.org/wiki/Flipkart",
                    logo:#imageLiteral(resourceName: "flipkart"))
        )
        
        arrCompany.append(
            Company(name:"Yahoo",
                    address:"Sunnyvale, California, U.S.",
                    url:"https://en.wikipedia.org/wiki/Yahoo!",
                    logo:#imageLiteral(resourceName: "yahoo"))
        )
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UITableViewCell {
            let indexPath = tblList.indexPath(for: cell)!
            if segue.identifier == "segueDetails" {
                if let detailsVC = segue.destination as? DetailVC {
                    detailsVC.url = arrCompany[indexPath.row].url
                }
            }
        } else if let btn = sender as? UIButton {
            if segue.identifier == "imagePreview" {
                if let previewVC = segue.destination as? ImagePreviewVC {
                    previewVC.img = arrCompany[btn.tag].logo
                }
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension  ListVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCompany.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ListCell")
        return cell!
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let listCell = cell as? ListCell {
            listCell.btnForce.tag = indexPath.row
            listCell.lblName.text = arrCompany[indexPath.row].name
            listCell.lblAddress.text = arrCompany[indexPath.row].address
            listCell.imgLogo.image = arrCompany[indexPath.row].logo
        }
    }
}
