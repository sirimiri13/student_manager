//
//  ViewController.swift
//  1712061_2
//
//  Created by Lam Huong on 10/16/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
   var selectedGender: String?
    var std: Students? = nil
   var indexPathForStudent: IndexPath? = nil
    
    var pickerData = ["Male","Female","Other"]
   // @IBOutlet weak var birthdayPicker: UIDatePicker!
    //@IBOutlet weak var genderPicker: UIPickerView!
    
   
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    
    @IBOutlet weak var infoText: UITextField!
    @IBOutlet weak var classText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func saveAdd(_ sender: Any) {
        performSegue(withIdentifier: "unwindToStudent", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HiddenKeyBoard()
        if let students = std {
            nameText.text = students.name
            genderText.text = students.gender
            birthdayText.text = students.dob
            classText.text = students.class_id
            infoText.text = students.info
        }

        createGenderPicker()
        createBirthdayPicker()
        createToolbar()
        // Do any additional setup after loading the view.
    }
    func createBirthdayPicker() {
        let birthdayPicker = UIDatePicker()
        birthdayPicker.datePickerMode = .date
        birthdayPicker.addTarget(self, action: #selector(ViewController.dateChanged(birthdayPicker:)), for: .valueChanged)
        birthdayText.inputView = birthdayPicker
    }
    
    @objc func dateChanged(birthdayPicker: UIDatePicker){
        let birthdayFormatter = DateFormatter()
        birthdayFormatter.dateFormat = "MMM dd, yyyy"
        birthdayText.text = birthdayFormatter.string(from: birthdayPicker.date)
    }
    
    func createGenderPicker() {
        let genderPicker = UIPickerView()
        genderPicker.delegate = self
        genderText.inputView = genderPicker
    }
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dissmissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        genderText.inputAccessoryView = toolBar
        birthdayText.inputAccessoryView = toolBar
    }
    @objc func dissmissKeyboard() {
           view.endEditing(true)
       }
    

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGender = pickerData[row]
        genderText.text = selectedGender
    }
    
    
}
extension ViewController{
    func HiddenKeyBoard(){
        
        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textDismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    @objc func textDismissKeyboard(){
        view.endEditing(true)
    }
}
