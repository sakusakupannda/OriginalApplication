//
//  AllSubjectsViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2018/01/13.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit

class AllSubjectsViewController: UIViewController {
    
    var recieveValue: String!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var textView: UITextView!
    var ScoreArray:[Int] = [0,0]
    let saveData: UserDefaults = UserDefaults.standard
    var i: Int = 0
    var number1: Float = 0.0
    var number2: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textView.text = saveData.object(forKey: "allnotes") as! String
        
        if ScoreArray == nil {
            saveData.register(defaults: ["ScoreArray": 0])
        } else {
            for i in 1...9 {
                ScoreArray = saveData.object(forKey: "Subject\(i)scores") as! [Int]
            }
            self.average()
        }
    }

    
    func average() {
        number2 = ScoreArray[0] + ScoreArray[1] + ScoreArray[2] + ScoreArray[3]  + ScoreArray[4] + ScoreArray[5] + ScoreArray[6] + ScoreArray[7] + ScoreArray[8]
        number1 = Float(number2 / 9)
        label1.text = String(number1)
        label2.text = String(number2)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
