//
//  ResultViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answerChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
      
        getResultAnimal()
    }

    @IBAction func donePressed(_ sender: UIBarButtonItem) {
       dismiss(animated: true)
    }
}

    
