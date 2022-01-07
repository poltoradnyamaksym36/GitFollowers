//
//  UIViewController+Ext.swift
//  GitFollowers
//
//  Created by max36 on 02.01.2022.
//

import UIKit

extension UIViewController {
    
    //MARK: - Public Methods
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
