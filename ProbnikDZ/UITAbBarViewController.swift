//
//  UITAbBarViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 12.08.2022.
//

import UIKit

class UITAbBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
