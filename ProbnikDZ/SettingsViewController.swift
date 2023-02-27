//
//  SettingsViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 11.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!
    
    var minimumValue: String!
    var maximumValue: String!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.text = minimumValue
        maximumValueTF.text = maximumValue
    }
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}
