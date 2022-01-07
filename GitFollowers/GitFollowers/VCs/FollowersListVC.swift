//
//  FollowersListVC.swift
//  GitFollowers
//
//  Created by max36 on 20.12.2021.
//

import UIKit

class FollowersListVC: UIViewController {

    var userName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
