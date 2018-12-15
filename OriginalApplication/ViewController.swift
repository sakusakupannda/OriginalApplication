//
//  ViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2018/01/13.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var value: String!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    
    var Array: [String] = [] //[教科名]
    var ScoreArray: [Double] = [0,0] //[教科ごとの点数]
    var tempArray: [Double] = [] //[全部の点数]
    let saveData: UserDefaults = UserDefaults.standard
    var avg1: Double = 0 //全教科の平均
    var sum1: Double = 0 //全教科の合計
    var avg2: Double = 0 //各教科の平均
    var sum2: Double = 0 //各教科の合計
    var num: Int = 0 //全体の満点だった時のやつ
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.calculate()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let saveData: UserDefaults = UserDefaults.standard
        Array = saveData.object(forKey: "name") as! [String]
        
        button1.setTitle(Array[1], for: .normal)
        button2.setTitle(Array[2], for: .normal)
        button3.setTitle(Array[3], for: .normal)
        button4.setTitle(Array[4], for: .normal)
        button5.setTitle(Array[5], for: .normal)
        button6.setTitle(Array[6], for: .normal)
        button7.setTitle(Array[7], for: .normal)
        button8.setTitle(Array[8], for: .normal)
        button9.setTitle(Array[9], for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func subject1Button() {
        if Array[1] == "" {
            value = "Subject1"
        } else {
            value = Array[1]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject2Button() {
        if Array[2] == "" {
            value = "Subject2"
        } else {
            value = Array[2]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject3Button() {
        if Array[3] == "" {
            value = "Subject3"
        } else {
            value = Array[3]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject4Button() {
        if Array[4] == "" {
            value = "Subject4"
        } else {
            value = Array[4]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject5Button() {
        if Array[5] == "" {
            value = "Subject5"
        } else {
            value = Array[5]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject6Button() {
        if Array[6] == "" {
            value = "Subject6"
        } else {
            value = Array[6]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject7Button() {
        if Array[7] == "" {
            value = "Subject7"
        } else {
            value = Array[7]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject8Button() {
        if Array[8] == "" {
            value = "Subject8"
        } else {
            value = Array[8]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject9Button() {
        if Array[9] == "" {
            value = "Subject9"
        } else {
            value = Array[9]
        }
        performSegue(withIdentifier: "toEach", sender: nil)
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func calculate() {
        sum1 = 0
        avg1 = 0
        Array = []
        Array = saveData.object(forKey: "name") as! [String]
        tempArray = []
        
        //教科ごとのfor文
        for i in 1..<Array.count {
        //for i in 1..<Array.count-2 {
            print(Array[i])
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
            
            //avg2の処理
            if ScoreArray.count == 0 {
                avg2 = 0
            } else {
                avg2 = sum2 / Double(ScoreArray.count)
            }
            
            //numの処理
            num = 100 * tempArray.count
            saveData.set(num, forKey: "num")
            
            
            print("平均点(avg2)は\(avg2)")
            saveData.set(avg2, forKey: "\(Array[i])avg2")
            print("合計点(sum2)は\(sum2)")
            saveData.set(sum2, forKey: "\(Array[i])sum2")
            print(ScoreArray)
        }
        
        //avg1の処理
        if tempArray.count == 0 {
            avg1 = 0
        } else {
            avg1 = sum1 / Double(tempArray.count)
        }
        
        
        print(tempArray)
        print("全部の合計点(sum1)は\(sum1)/\(num)")
        saveData.set(sum1, forKey: "sum1")
        print("全部の平均点(avg1)は\(avg1)")
        saveData.set(avg1, forKey: "avg1")
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEach" {
            let secondViewController: EachSubjectViewController = segue.destination as! EachSubjectViewController
            secondViewController.recieveValue = self.value
            secondViewController.Array = self.Array
        }
    }
}
