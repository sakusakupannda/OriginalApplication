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
    var ArrayAB: [Int] = [0,0,0,0,0,0,0,0,0]
    let saveData: UserDefaults = UserDefaults.standard
    var avg1A: Double = 0 //全教科の平均
    var avg1B: Double = 0 //全教科の平均
    var sum1A: Double = 0 //全教科の合計
    var sum1B: Double = 0 //全教科の合計
    var avg2A: Double = 0 //各教科の平均
    var avg2B: Double = 0 //各教科の平均
    var sum2A: Double = 0 //各教科の合計
    var sum2B: Double = 0 //各教科の合計
    var numA: Int = 0 //全体の満点だった時のやつ
    var numB: Int = 0 //全体の満点だった時のやつ
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.calculate()
        
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
        let next = storyboard!.instantiateViewController(withIdentifier: "Name")
        self.present(next, animated: true, completion: nil)
        //self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func calculate() {
        saveData.register(defaults: ["ArrayAB": [0,0,0,0,0,0,0,0,0]])
        ArrayAB = (saveData.object(forKey: "ArrayAB") as? [Int])!
        //sum1 = 0
        //avg1 = 0
        Array = []
        Array = saveData.object(forKey: "name") as! [String]
        tempArray = []
        
        //教科ごとのfor文
        for i in 1..<Array.count {
            //print(Array[i])
            //print(ArrayAB)
            
            if ArrayAB[i-1] == 0 {
                sum2A = 0
                avg2A = 0
                
                //各教科のScoreArrayに点数を入れる
                ScoreArray = []
                saveData.register(defaults: ["ScoreArray": []])
                saveData.register(defaults: ["\(Array[i])scores": []])
                ScoreArray = (saveData.object(forKey: "\(Array[i])scores") as? [Double])!
                
                
                //点数を足していく
                for i in 0..<ScoreArray.count{
                    sum1A = sum1A + ScoreArray[i]
                    tempArray.append(ScoreArray[i])
                    sum2A = sum2A + ScoreArray[i]
                }
                
                //avg2の処理
                if ScoreArray.count == 0 {
                    avg2A = 0
                } else {
                    avg2A = sum2A / Double(ScoreArray.count)
                }
                
                //numの処理
                numA = 100 * tempArray.count
                saveData.set(numA, forKey: "numA")
                
                
                //print("Aの平均点(avg2A)は\(avg2A)")
                saveData.set(avg2A, forKey: "\(Array[i])avg2A")
                //print("Aの合計点(sum2A)は\(sum2A)")
                saveData.set(sum2A, forKey: "\(Array[i])sum2A")
                //print(ScoreArray)
            
                //avg1の処理
                if tempArray.count == 0 {
                    avg1A = 0
                } else {
                avg1A = sum1A / Double(tempArray.count)
                }
            
            
                //print(tempArray)
                //print("Aの全部の合計点(sum1A)は\(sum1A)/\(numA)")
                saveData.set(sum1A, forKey: "sum1A")
                //print("Aの全部の平均点(avg1A)は\(avg1A)")
                saveData.set(avg1A, forKey: "avg1A")
            
            } else if ArrayAB[i-1] == 1 {
                sum2B = 0
                avg2B = 0
            
                //各教科のScoreArrayに点数を入れる
                ScoreArray = []
                saveData.register(defaults: ["ScoreArray": []])
                saveData.register(defaults: ["\(Array[i])scores": []])
                ScoreArray = (saveData.object(forKey: "\(Array[i])scores") as? [Double])!
                
                
                //点数を足していく
                for i in 0..<ScoreArray.count{
                    sum1B = sum1B + ScoreArray[i]
                    tempArray.append(ScoreArray[i])
                    sum2B = sum2B + ScoreArray[i]
                }
                
                //avg2の処理
                if ScoreArray.count == 0 {
                    avg2B = 0
                } else {
                    avg2B = sum2B / Double(ScoreArray.count)
                }
                
                //numの処理
                numB = 100 * tempArray.count
                saveData.set(numB, forKey: "numB")
                
                
                //print("Bの平均点(avg2B)は\(avg2B)")
                saveData.set(avg2B, forKey: "\(Array[i])avg2B")
                //print("Bの合計点(sum2B)は\(sum2B)")
                saveData.set(sum2B, forKey: "\(Array[i])sum2B")
                //print(ScoreArray)
        
                //avg1の処理
                if tempArray.count == 0 {
                    avg1B = 0
                } else {
                    avg1B = sum1B / Double(tempArray.count)
                }
                
                
                //print(tempArray)
                //print("Bの全部の合計点(sum1B)は\(sum1B)/\(numB)")
                saveData.set(sum1B, forKey: "sum1B")
                //print("Bの全部の平均点(avg1B)は\(avg1B)")
                saveData.set(avg1B, forKey: "avg1B")
            }
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEach" {
            let secondViewController: EachSubjectViewController = segue.destination as! EachSubjectViewController
            secondViewController.recieveValue = self.value
        }
    }
}
