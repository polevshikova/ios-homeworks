//
//  MainTabBarControllerViewController.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 26.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let feedViewController = createNavController(vc: FeedViewController(), itemName: "Feed", ItemImage: "arrow.up.arrow.down")
        
        let profileViewController = createNavController(vc: ProfileViewController(), itemName: "Profile", ItemImage: "person.crop.rectangle")

        viewControllers = [feedViewController, profileViewController]
        
    }
    
    
    func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0))  ,tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }


}
