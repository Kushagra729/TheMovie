//
//  MovieVC.swift
//  TheMovie
//
//  Created by Osvin-Mob-MAc on 28/04/22.
//

import UIKit
import Kingfisher

class MovieVC: UIViewController{
//MARK: - IBOutlets
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverviewTV: UITextView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
//MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
//MARK: - UserDefined Methods
    
    // Set the UI
    func setUI(){
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        movieNameLabel.text = movieModel?.original_title
        movieNameLabel.textColor = UIColor.white
        movieOverviewTV.text = movieModel?.overview
        print(movieModel?.production_companies?[0].name ?? "")
        if let poster = movieModel?.poster_path {
            let url = URL(string: "\(imageBaseURL)/\(poster)")
            movieImageView.kf.setImage(with: url)
        }
    }
}
//MARK: - Extentions

extension MovieVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieModel?.production_companies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.nameLb.text = movieModel?.production_companies?[indexPath.row].name
        cell.originCountry.text = movieModel?.production_companies?[indexPath.row].origin_country
        if let logo = movieModel?.production_companies?[indexPath.row].logo_path{
            let url = URL(string: "\(imageBaseURL)\(logo)")
            cell.companyLogo.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "CompanyDetailsVC") as! CompanyDetailsVC
        nav.company = movieModel?.production_companies?[indexPath.row]
        nav.modalTransitionStyle = .crossDissolve
        nav.modalPresentationStyle = .overCurrentContext
        self.present(nav, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
