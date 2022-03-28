//
//  FollowersListVC.swift
//  GitFollowers
//
//  Created by max36 on 20.12.2021.
//

import UIKit

class FollowersListVC: UIViewController {

    //MARK: - Properties
    var userName: String!
    
    //MARK: - Visual Components
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Test", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            print("Followers.count = \(followers.count)")
            print(followers)
        }
    }
}
