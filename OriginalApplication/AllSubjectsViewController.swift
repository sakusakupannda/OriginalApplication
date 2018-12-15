//
//  AllSubjectsViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2018/01/13.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit

class AllSubjectsViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label8: UILabel!
    @IBOutlet var textView: UITextView!
    let saveData: UserDefaults = UserDefaults.standard
    var avg1: Double = 0 //全教科の平均
    var sum1: Int = 0 //全教科の合計
    var num: Int = 0 //全体の満点だった時のやつ
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        saveData.register(defaults: ["avg1" : 0.0])
        avg1 = saveData.object(forKey: "avg1") as! Double
        label4.text = String(avg1)
            
        saveData.register(defaults: ["sum1" : 0.0])
        sum1 = saveData.object(forKey: "sum1") as! Int
        label5.text = String(sum1)
            
        saveData.register(defaults: ["num" : 0.0])
        num =  saveData.object(forKey: "num") as! Int
        label7.text = String(num)
            
        print("平均は\(String(describing: label4.text))点")
        print("合計は\(String(describing: label5.text))/\(num)点")
        
        saveData.register(defaults: ["allnotes" : ""])
        textView.text = saveData.object(forKey: "allnotes") as? String
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save() {
        saveData.set(textView.text, forKey: "allnotes")
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
