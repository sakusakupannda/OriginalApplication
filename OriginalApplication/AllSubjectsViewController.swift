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
    @IBOutlet var textView: UITextView!
    @IBOutlet var textField: UITextField!
    var ScoreArray: [Int] = [0,0]
    var tempScoreArray: [Int] = []
    var Array :[String] = []
    let saveData: UserDefaults = UserDefaults.standard
    var i: Int = 1
    var number1: Double = 0.00
    var number2: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ScoreArray = []
        Array = []
        
        saveData.register(defaults: ["allnotes" : ""])
        textView.text = saveData.object(forKey: "allnotes") as? String
        if ScoreArray == [] {
            saveData.register(defaults: ["ScoreArray": 0])
        }
        
        self.average()
        label1.text = "--"
        label2.text = "--"
    }
    
    @IBAction func number() {
        if Int(textField.text!) == 0 {
            let alert: UIAlertController = UIAlertController(title: "計算に失敗しました", message: "0以外の数字を入れてください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
        } else if textField.text == "" {
            let alert: UIAlertController = UIAlertController(title: "計算に失敗しました", message: "科目数を入れてください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
        } else {
            self.average()
            number1 = Double(number2 / Int(textField.text!)!)
            label1.text = String(number2)
            label2.text = String(number1)
            print("平均は\(number1)点")
            print("合計は\(number2)点")
        }
    }

    func average() {
        Array = saveData.object(forKey: "name") as! [String]
        number1 = 0
        number2 = 0
        i = 1
        
        for i in 1...9 {
            print(i)
            print(Array[i])
            print(ScoreArray)
            print(tempScoreArray.count)
            
            
//            if tempScoreArray.count != 0 {
//
//
//                if ScoreArray.count != 0 {
//                    ScoreArray.append(0)
//                } else {
//                    ScoreArray = saveData.object(forKey: "\(Array[i])scores") as! [Int]
//                    tempScoreArray.append(ScoreArray[0])
//                }
//
//
//
//            } else {
            
            
//                ScoreArray = saveData.object(forKey: "\(Array[i])scores") as! [Int]
                ScoreArray.append(0)
            
            
//            }
            
            
            print(ScoreArray)
            print(number2)
            number2 = number2 + ScoreArray[0]
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAll" {
            let VC: ViewController = segue.destination as! ViewController
            VC.Array = self.Array
        } else if segue.identifier == "toBarChart" {
            let secondViewController: BarChartViewController = segue.destination as! BarChartViewController
            secondViewController.datapoints = self.Array
        }
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
