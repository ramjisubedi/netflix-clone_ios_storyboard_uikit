//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Ramji Subedi on 29/08/2022.
//

import UIKit

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
        
        
        // assign btn for tab bar
        setViewControllers([btn1,btn2,btn3,btn4], animated: true)
    }


}

