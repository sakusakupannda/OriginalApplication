//
//  NameViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2018/07/22.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet var TextField1: UITextField!
    @IBOutlet var TextField2: UITextField!
    @IBOutlet var TextField3: UITextField!
    @IBOutlet var TextField4: UITextField!
    @IBOutlet var TextField5: UITextField!
    @IBOutlet var TextField6: UITextField!
    @IBOutlet var TextField7: UITextField!
    @IBOutlet var TextField8: UITextField!
    @IBOutlet var TextField9: UITextField!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label8: UILabel!
    @IBOutlet var label9: UILabel!
    
    var Array: [String] = []
    
    let saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clear()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button() {
        print(TextField1.text!)
        Array = ["ALL", TextField1.text!, TextField2.text!, TextField3.text!, TextField4.text!, TextField5.text!, TextField6.text!, TextField7.text!, TextField8.text!, TextField9.text!]
        print(Array[1])
        saveData.set(Array, forKey: "name")
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clear() {
        TextField1.text = ""
        TextField2.text = ""
        TextField3.text = ""
        TextField4.text = ""
        TextField5.text = ""
        TextField6.text = ""
        TextField7.text = ""
        TextField8.text = ""
        TextField9.text = ""
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
    
}
