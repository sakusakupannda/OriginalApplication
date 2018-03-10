
//
//  EachSubjectViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2018/01/13.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit

class EachSubjectViewController: UIViewController {
    
    var recieveValue: String!
    var value: Double!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var TextField: UITextField!
    var Subject1 = [100,90]

    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = recieveValue
        saveData.object(forKey: "score")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func save() {
        Subject1 = saveData.object(forKey: "score") as! [Int]
        Subject1.append (Int(TextField.text!)!)
        saveData.set(Subject1, forKey: "score")
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScores" {
            let secondViewController: ScoresViewController = segue.destination as! ScoresViewController
            secondViewController.scoreArray = self.Subject1
        } else if segue.identifier == "toNotes" {
            let secondViewController: NotesViewController = segue.destination as! NotesViewController
            secondViewController.recieveValue = self.value
        
        }
    }
    
    let saveData: UserDefaults = UserDefaults.standard
    
}
