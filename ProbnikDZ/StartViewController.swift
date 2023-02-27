//
//  MainViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 12.08.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBar = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBar.viewControllers else {return}
        
        for viewController in viewControllers {
            if let firstVC = viewController as? FirstViewController {
                firstVC.view.backgroundColor = .systemRed
            } else if let secondVC = viewController as? SecondViewController {
                secondVC.view.backgroundColor = .systemBlue
            } else if let navigationVC = viewController as? UINavigationController {
                guard let thirdVC =  navigationVC.topViewController as? ThirdViewController else {
                    return
                }
                thirdVC.title = "Third Screen"
                thirdVC.view.backgroundColor = .systemCyan
            }
        }
    }
}

