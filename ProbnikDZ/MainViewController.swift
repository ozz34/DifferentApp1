//
//  ViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 01.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    
    @IBOutlet var getRandomValueLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        
        settingsVC.minimumValue = minimumValueLabel.text
        settingsVC.maximumValue = maximumValueLabel.text
    }
    
    @IBAction func getRandonNumberButtonTapped() {
        
        let minimumNumber = Int(minimumValueLabel.text ?? "") ?? 0
        let maximumNumber = Int(maximumValueLabel.text ?? "") ?? 100
        
        randomValueLabel.text = Int.random(in: minimumNumber...maximumNumber).formatted()
    }
    
    
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let settingsVC = segue.source as? SettingsViewController else {return}
        minimumValueLabel.text = settingsVC.minimumValueTF.text
        maximumValueLabel.text = settingsVC.maximumValueTF.text
        
        
        
    }
}

