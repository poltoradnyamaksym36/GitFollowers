//
//  SceneDelegate.swift
//  GitFollowers
//
//  Created by max36 on 12.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        UINavigationBar.configureNavBarAppearance()
        let searchNC = UINavigationController(rootViewController: SearchVC())
        let favouritesNC = UINavigationController(rootViewController: FavoritesListVC())
        
        let tabbar = UITabBarController()
        tabbar.viewControllers = [searchNC, favouritesNC]
        
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
        
        configureNavigationBar()
    }
    
    //MARK: - Public Properties
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFC() -> UINavigationController {
        let favouritesListVC = FavoritesListVC()
        favouritesListVC.title = "Favourites"
        favouritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favouritesListVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .black
        UITabBar.configureTabBarAppearance()
        tabbar.viewControllers = [createSearchNC(),createFC()]
        
        return tabbar
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

//MARK: - UITabBar
extension UITabBar  {
    static func configureTabBarAppearance() {
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .systemGray
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

//MARK: - UINavigationBar
extension UINavigationBar {
    static func configureNavBarAppearance() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}
