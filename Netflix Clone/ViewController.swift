//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Ramji Subedi on 29/08/2022.
//

import UIKit
// UITabBarController = tabbar view ko lagi
class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
        
        // let for static variable (it's value is not change)
        // create a TAB BAR MENU view controller
        let btn1 = UINavigationController(rootViewController: HomeViewController())
        let btn2 = UINavigationController(rootViewController: UpcomingViewController())
        let btn3 = UINavigationController(rootViewController: SearchViewController())
        let btn4 = UINavigationController(rootViewController: DownloadViewController())
        
        // set tab bar item icons
        
        btn1.tabBarItem.image = UIImage(systemName: "house")
        btn2.tabBarItem.image = UIImage(systemName: "play.circle")
        btn3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        btn4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        // set title for item bar
        btn1.title = "Home"
        btn2.title = "Upcomming"
        btn3.title = "Search"
        btn4.title = "Download"
        
        // set tintColer  
        //Tint color is a "default" or "fallback" color for the application or UIView
        tabBar.tintColor = .label
        // assign btn for tab bar
        setViewControllers([btn1,btn2,btn3,btn4], animated: true)
    }


}

