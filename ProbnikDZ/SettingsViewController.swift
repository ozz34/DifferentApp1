//
//  SettingsViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 11.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!
    
    var minimumValue: String!
    var maximumValue: String!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        minimumValueTF.text = minimumValue
        maximumValueTF.text = maximumValue
        
    }
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    

    /*
     
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        
    }
    */

}
