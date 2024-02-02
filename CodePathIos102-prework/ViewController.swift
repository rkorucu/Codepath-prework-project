//
//  ViewController.swift
//  CodePathIos102-prework
//
//  Created by Ramazan on 2/2/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var colourPickerSection: UIColorWell!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var schoolTextField: UITextField!
    
    
    @IBOutlet weak var yearSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var numberPetsCount: UILabel!
    
    @IBOutlet weak var moreSwiftPets: UISwitch!
    @IBOutlet weak var morepetsStepper: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let defaults = UserDefaults.standard
        firstNameTextField.text = "Hello"
        firstNameTextField.text = defaults.string(forKey: "FirstName")
        lastNameTextField.text = defaults.string(forKey: "LastName")
        schoolTextField.text = defaults.string(forKey: "SchoolName")
        yearSegmentControl.selectedSegmentIndex = defaults.integer(forKey: "Year")
        if(defaults.string(forKey: "PetsCount")==nil) {
            defaults.set("0", forKey: "PetsCount")
            morepetsStepper.value = 0
        }
        numberPetsCount.text = defaults.string(forKey: "PetsCount")
        morepetsStepper.value = Double(0 + Int(numberPetsCount.text!)!)
        moreSwiftPets.isOn = defaults.bool(forKey: "MorePetsSwitch")
        
        
        
    }
    
    
    
    

    @IBAction func morePetsStep(_ sender: UIStepper) {
        numberPetsCount.text = "\(Int(sender.value))"
    }
    
    @IBAction func introduceSelfButton(_ sender: Any) {
        let year = yearSegmentControl.titleForSegment(at: yearSegmentControl.selectedSegmentIndex)
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolTextField.text!). I am currently in my \(year!) year and I own \(numberPetsCount.text!) dogs. It is \(moreSwiftPets.isOn) that I want more pets."
        
        let selectedColor = colourPickerSection.selectedColor
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        alertController.addAction(action)
        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = selectedColor
        alertController.view.tintColor = UIColor.black
        present(alertController, animated: true, completion: nil)
        
        let defaults = UserDefaults.standard
        defaults.set(firstNameTextField.text, forKey: "FirstName")
        defaults.set(lastNameTextField.text, forKey: "LastName")
        defaults.set(schoolTextField.text, forKey: "SchoolName")
        defaults.set(year, forKey: "Year")
        defaults.set(numberPetsCount.text, forKey: "PetsCount")
        defaults.set(moreSwiftPets.isOn, forKey: "MorePetsSwitch")
    
        
        
    }
}

