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
    @IBOutlet var label: UILabel!
    @IBOutlet var TextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = recieveValue
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
        saveData.set(TextField.text, forKey: "score")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScores" {let secondViewController: ScoresViewController = segue.destination as! ScoresViewController
            secondViewController.recieveValue = self.value
        } else if segue.identifier == "toNotes" {let secondViewController: NotesViewController = segue.destination as! NotesViewController
            secondViewController.recieveValue = self.value
        
        }
    }
    
    let saveData: UserDefaults = UserDefaults.standard
    
}
