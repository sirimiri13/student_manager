//
//  MyTableViewController.swift
//  1712061_2
//
//  Created by Lam Huong on 10/16/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
     var students : [Students] = []
    
       override func viewDidLoad() {
           super.viewDidLoad()
           let Huong = Students(name: "Lâm Quỳnh Hương", gender: "Female", dob : "April 13 1999" , class_id: "IT", info: "Dev")
            let bao = Students(name: "Cao Ngọc Bảo", gender: "Male", dob: "Oct 28 1999", class_id: "12TH", info: "Member")
                  students.append(Huong)
        students.append(bao)
                  tableView.reloadData()
               tableView.estimatedRowHeight = 140
                  tableView.rowHeight = 140

           // Uncomment the following line to preserve selection between presentations
           // self.clearsSelectionOnViewWillAppear = false

           // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
       }

       // MARK: - Table view data source

       override func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return students.count
       }

       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
           let student = students[indexPath.row]
           cell1.titleInfo.text = student.name
           let result = "Gender: \(student.gender) \nBirthday: \(student.dob) \nClass: \(student.class_id) \nOther Info: \(student.info) "
           cell1.subInfo.text = result
           // Configure the cell...
            
           return cell1
       }
       @IBAction func unwindToStudent(segue: UIStoryboardSegue){
         guard let viewController = segue.source as? ViewController else {return}
               
               guard let name = viewController.nameText.text, let gender = viewController.genderText.text, let birthday = viewController.birthdayText.text, let className = viewController.classText.text, let otherInfo = viewController.infoText.text else { return }
        let student = Students(name: name, gender: gender, dob: birthday, class_id: className, info: otherInfo)
               if let indexPath = viewController.indexPathForStudent {
                   students[indexPath.row] = student
               }
               else {
                   students.append(student)
               }
               tableView.reloadData()
           }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            guard let viewController = segue.destination as? InfoViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let student = students[indexPath.row]
            viewController.std = student
            viewController.indexPath = indexPath
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

func getFormattedDate(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
}

