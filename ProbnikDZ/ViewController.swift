//
//  ViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 01.08.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchLabel: UILabel!
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        setupMAinLabel()
        setupTextField()
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
    }
    // MARK: - Helpers
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .yellow
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        default:
            label.text = "The third segment is selected"
            label.textColor = .red
        }
    }
    
    @IBAction func sliderAction() {
        label.text = String((round(slider.value * 100)/100))
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
   
    @IBAction func buttonAction() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "text field is empty", message: "please enter name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", message: "please enter name")
            return
        }
        label.text = textField.text
    }
    
    @IBAction func datePickerAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        label.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
        switchLabel.text = sender.isOn ? "Hide Date Picker" : "Show Date Picker"
    }
    
    private func setupMAinLabel() {
        label.text = String(slider.value)
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
    }
    
    private func setupSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 3
        slider.maximumTrackTintColor = .red
        slider.maximumTrackTintColor = .green
        slider.thumbTintColor = .black
    }
    
    private func setupTextField() {
        textField.placeholder = "Enter your name"
    }
}

// MARK: - UIAlertController
extension ViewController {
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
