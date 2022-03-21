//
//  TabBarViewController.swift
//  immi
//
//  Created by user217004 on 3/19/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //MARK: - Properties

    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        configureViewControllers()
        
    }

    //MARK: - Selectors
  
    
    //MARK: - Helpers
    
    func configureViewControllers() {
        let feed = FeedViewController()
        //embedding all these controllers in navigation controller so they can move back and forth with ease
        let nav1 = templateNavigationController(image: UIImage(systemName: "globe"), rootViewController: feed)
        let resource = ResourceViewController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "folder"), rootViewController: resource)
        let notification = NotificationViewController()
        let nav3 = templateNavigationController(image: UIImage(systemName: "heart"), rootViewController: notification)
        let chat = ChatViewController()
        let nav4 = templateNavigationController(image: UIImage(systemName: "person"), rootViewController: chat)
        
        //add these to tabcotnrollers
        viewControllers = [nav1,nav2,nav3,nav4]
    }
    
    func templateNavigationController(image:UIImage?,rootViewController:UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .black
        return nav
    }
}
