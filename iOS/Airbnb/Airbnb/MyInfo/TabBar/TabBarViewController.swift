//
//  TabBarViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
    }
    
    private func attribute() {
        self.view.backgroundColor = .white
        tabBar.tintColor = UIColor(named: "Grey1")
        tabBar.unselectedItemTintColor = UIColor(named: "Grey3")
        setUpTabBar()
    }
    
    private func setUpTabBar() {
        
        let searchNavigationController = UINavigationController(rootViewController: SearchViewController())
        searchNavigationController.tabBarItem.title = "검색"
        searchNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Search")
        
        let wishListNavigationController = UINavigationController(rootViewController: WishListViewController())
        wishListNavigationController.tabBarItem.title = "위시리스트"
        wishListNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Heart")
        
        let myInfomationNavigationController = UINavigationController(rootViewController: MyInfoViewController())
        myInfomationNavigationController.tabBarItem.title = "내 예약"
        myInfomationNavigationController.tabBarItem.image = #imageLiteral(resourceName: "User")
        
        viewControllers = [
            searchNavigationController, wishListNavigationController, myInfomationNavigationController
        ]
    }
}
