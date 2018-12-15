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
    var ScoreArray: [Double] = [0,0]
    var tempArray: [Double] = []
    var avgArray: [Double] = []
    var Array: [String] = [] //教科名のArray
    let saveData: UserDefaults = UserDefaults.standard
    var avg1: Double = 0 //全教科の平均
    var sum1: Double = 0 //全教科の合計
    var avg2: Double = 0 //各教科の平均
    var sum2: Double = 0 //各教科の合計
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.calculate()
        print("平均は\(avg1)点")
        print("合計は\(sum1)点")
        
        saveData.register(defaults: ["allnotes" : ""])
        textView.text = saveData.object(forKey: "allnotes") as? String
    }
    
    

    func calculate() {
        var num: Int = 0 //全体の満点だった時のやつ
        sum1 = 0
        avg1 = 0
        Array = []
        Array = saveData.object(forKey: "name") as! [String]
        tempArray = []
        
        //教科ごとのfor文
        for i in 1..<Array.count {
        //for i in 1..<Array.count-2 {
            sum2 = 0
            avg2 = 0
            
            //各教科のScoreArrayに点数を入れる
            ScoreArray = []
            saveData.register(defaults: ["ScoreArray": []])
            saveData.register(defaults: ["\(Array[i])scores": []])
            ScoreArray = (saveData.object(forKey: "\(Array[i])scores") as? [Double])!
            
            //点数を足していく
            for i in 0..<ScoreArray.count{
                sum1 = sum1 + ScoreArray[i]
                tempArray.append(ScoreArray[i])
                sum2 = sum2 + ScoreArray[i]
            }
            
            if ScoreArray.count == 0 {
                avg2 = 0
            } else {
                avg2 = sum2 / Double(ScoreArray.count)
            }
            avgArray.append(avg2)
            saveData.set(avgArray, forKey: "\(Array[i])avg") //BarChartVCで使う
            num = 100 * tempArray.count
            
            print(Array[i])
            print(ScoreArray)
            print(tempArray)
            print(sum2)
            print(avg2)
        }
        
        if tempArray.count == 0 {
            avg1 = 0
        } else {
            avg1 = sum1 / Double(tempArray.count)
        }
        print(avgArray)
        print(sum1)
        print(avg1)
        label4.text = String(avg1)
        label5.text = String(Int(sum1))
        label7.text = String(num)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAll" {
            let VC: ViewController = segue.destination as! ViewController
            VC.Array = self.Array
        } else if segue.identifier == "toBarChart" {
            let secondViewController: BarChartViewController = segue.destination as! BarChartViewController
            secondViewController.entry = self.ScoreArray
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
