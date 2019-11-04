//
//  InfoViewController.swift
//  1712061_2
//
//  Created by Lam Huong on 10/17/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var std: Students? = nil
    var isDeleted: Bool = false
    var indexPath: IndexPath? = nil
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet weak var classText: UILabel!
    @IBOutlet weak var birthdayText: UILabel!
    @IBOutlet weak var genderText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = std?.name
        genderText.text = std?.gender
        birthdayText.text = std?.dob
        classText.text = std?.class_id
        infoText.text = std?.info
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteStudent(_ sender: Any) {
        isDeleted = true
        performSegue(withIdentifier: "unwindToStudent", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "editInfo" {
               guard let viewController = segue.destination as? ViewController else { return }
               viewController.std = std
            viewController.indexPathForStudent = self.indexPath!
            
           }
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
