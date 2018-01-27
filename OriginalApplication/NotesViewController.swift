//
//  NotesViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2018/01/13.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    var recieveValue: Double!
    @IBOutlet var TextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextView.text = saveData.object(forKey: "notes") as? String

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
    
    let saveData: UserDefaults = UserDefaults.standard
    
    @IBAction func save() {
        saveData.set(TextView.text, forKey: "notes")
    }

}
