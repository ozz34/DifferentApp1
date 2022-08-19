//
//  ResultViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
      
    }

    @IBAction func donePressed(_ sender: UIBarButtonItem) {
       dismiss(animated: true)
    }
    
}
