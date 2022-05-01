//
//  CompanyDetailsVC.swift
//  TheMovie
//
//  Created by Osvin-Mob-MAc on 01/05/22.
//

import UIKit
import Kingfisher
class CompanyDetailsVC: UIViewController {
//MARK: - IBOutlets

    @IBOutlet weak var detailTopView: UIView!
    @IBOutlet weak var detailBottomView: UIView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
//MARK: - Variables
    
    var company : ProductionCompany?
    
//MARK: - Override methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

//MARK: - UserDefined Methods

    func setUI(){
        detailTopView.layer.cornerRadius = 20
        detailBottomView.layer.cornerRadius = 20
        idLabel.text = "Id : \(company?.id ?? 0)"
        nameLabel.text = "Name :\(company?.name ?? "NA")"
        countryLabel.text = "Company : \(company?.origin_country ?? "NA")"
        if let logo = company?.logo_path {
            let url = URL(string: "\(imageBaseURL)\(logo)")
            movieImage.kf.setImage(with: url)
        }
    }
//MARK: - IBActions

    @IBAction func backBTN(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

