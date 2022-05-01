//
//  SplashVC.swift
//  TheMovie
//
//  Created by Osvin-Mob-MAc on 01/05/22.
//

import UIKit

class SplashVC: UIViewController {
//MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
//MARK: - UserDefined Methods
    
    func fetchData(){
        MovieModel.fireApi { responseObject, errMsg, erorCode in
            if let responseObject = responseObject {
                movieModel = responseObject
                let nav = self.storyboard?.instantiateViewController(withIdentifier: "MovieVC") as! MovieVC
                self.navigationController?.pushViewController(nav, animated: false)
            }
        }
    }
}
