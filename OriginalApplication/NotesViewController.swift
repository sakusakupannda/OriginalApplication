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
    var saveData: UserDefaults = UserDefaults.standard
    var text: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(text)notes")
        TextView.text = saveData.object(forKey: "\(text)notes") as! String?
       
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
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func save() {
        
            saveData.set(TextView.text, forKey: "\(text!)notes")
            let alert: UIAlertController = UIAlertController(title: "保存", message: "保存しました", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
        
    }

}
