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
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var TextField: UITextField!
    @IBOutlet var SegmentedControl: UISegmentedControl!
    var ScoreArray: [Double]! = []
    var ArrayAB: [Int]! = [0,0,0,0,0,0,0,0,0,0]
    var Array: [String]! //教科名
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
    let saveData: UserDefaults = UserDefaults.standard
    var i: Int = 0
    var num: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1.text = recieveValue
        Array = []
        Array = saveData.object(forKey: "name") as? [String]
        while Array[i] != label1.text {
            i = i + 1
        }
        print(i)
        saveData.register(defaults: ["ArrayAB": [0,0,0,0,0,0,0,0,0,0]])
        ArrayAB = saveData.object(forKey: "ArrayAB") as? [Int]
        num = ArrayAB[i]
        print("numは\(num)")

        if num == 0 {
            SegmentedControl.selectedSegmentIndex = 0
        } else if num == 1 {
            SegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if ArrayAB[i] == 0 {
            label3.text = "--"
            saveData.register(defaults: ["\(label1.text!)avg2" : 0.0])
            avg2A = saveData.object(forKey: "\(label1.text!)avg2") as! Double
            label3.text = String(avg2A)
            print("平均は\(avg2A)点")
            
            saveData.register(defaults: ["\(label1.text!)scores": []])
            ScoreArray = saveData.object(forKey: "\(label1.text!)scores") as? [Double]
            print(ScoreArray)
            self.calculate(number: num)
        } else if ArrayAB[i] == 1{
            label3.text = "--"
            saveData.register(defaults: ["\(label1.text!)avg2" : 0.0])
            avg2B = saveData.object(forKey: "\(label1.text!)avg2") as! Double
            label3.text = String(avg2B)
            print("平均は\(avg2B)点")
            
            saveData.register(defaults: ["\(label1.text!)scores": []])
            ScoreArray = saveData.object(forKey: "\(label1.text!)scores") as? [Double]
            print(ScoreArray)
            self.calculate(number: num)
        }
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
    
    @IBAction func toScores(){
        performSegue(withIdentifier: "toScores", sender: nil)
    }
    
    @IBAction func save() {
        if TextField.text == "" {
            let alert: UIAlertController = UIAlertController(title: "保存に失敗しました", message: "点数を入れてください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
        } else if Int(TextField.text!)! > 10000 {
            let alert: UIAlertController = UIAlertController(title: "保存に失敗しました", message: "10000以下の数字を入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
            TextField.text = ""
        } else {
            ScoreArray.append(Double(TextField.text!)!)
            saveData.set(ScoreArray, forKey: "\(label1.text!)scores")
            TextField.text = ""
            print(ScoreArray)
            let alert: UIAlertController = UIAlertController(title: "保存", message: "保存しました", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func calculate(number: Int) {
        print(ScoreArray)
        if number == 0 {
            sum2A = 0
            for i in 0..<ScoreArray.count {
                sum2A = sum2A + ScoreArray[i]
            }
            saveData.set(sum2A, forKey: "\(label1.text!)sum2")
            
            if ScoreArray.count == 0 {
                avg2A = 0
            } else {
                avg2A = sum2A / Double(ScoreArray.count)
            }
            saveData.set(avg2A, forKey: "\(label1.text!)avg2")
            
            numA = saveData.object(forKey: "numA") as! Int
            numA = numA + 1
            saveData.set(numA, forKey: "numA")
            
            label3.text = String(avg2A)
            print("平均は\(avg2A)点")
        } else if number == 1 {
            sum2B = 0
            for i in 0..<ScoreArray.count {
                sum2B = sum2B + ScoreArray[i]
            }
            saveData.set(sum2B, forKey: "\(label1.text!)sum2B")
            
            if ScoreArray.count == 0 {
                avg2B = 0
            } else {
                avg2B = sum2B / Double(ScoreArray.count)
            }
            saveData.set(avg2B, forKey: "\(label1.text!)avg2B")
            
            numB = saveData.object(forKey: "numB") as! Int
            numB = numB + 1
            saveData.set(numB, forKey: "numB")
            
            label3.text = String(avg2B)
            print("平均は\(avg2B)点")
        }

    }
    
    @IBAction func selectorSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.button(number: 0)
        case 1:
            self.button(number: 1)
        default:
            print("error")
        }
    }
    
    
    func button(number: Int){
        saveData.register(defaults: ["ArrayAB": [0,0,0,0,0,0,0,0,0,0]])
        ArrayAB = saveData.object(forKey: "ArrayAB") as? [Int]
        ArrayAB[i] = number
        print(ArrayAB)
        saveData.set(ArrayAB, forKey: "ArrayAB")
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
//    func hensachi() {
//    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScores" {
            let ScoreVC: ScoresViewController = segue.destination as! ScoresViewController
            ScoreVC.ScoreArray = self.ScoreArray
            ScoreVC.text = self.label1.text
        } else if segue.identifier == "toNotes" {
            let NotesVC: NotesViewController = segue.destination as! NotesViewController
            NotesVC.recieveValue = self.value
            NotesVC.text = self.label1.text
        } else if segue.identifier == "toLineChart" {
            let LineChartVC: LineChartViewController = segue.destination as! LineChartViewController
            LineChartVC.ScoreArray = self.ScoreArray
            LineChartVC.text = self.label1.text
        }
    }
    
    
}
