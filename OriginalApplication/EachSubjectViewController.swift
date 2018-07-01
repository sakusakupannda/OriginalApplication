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
    @IBOutlet var TextField: UITextField!
    var ScoreArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = recieveValue
        saveData.register(defaults: ["\(label1.text)score" : []])
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
    
    @IBAction func toScores(){
        performSegue(withIdentifier: "toScores", sender: nil)
    }
    
    @IBAction func save() {
        if TextField.text == "" {
            let alert: UIAlertController = UIAlertController(title: "保存に失敗しました", message: "点数を入れてください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
        } else if Int(TextField.text!)! > 1000 {
            let alert: UIAlertController = UIAlertController(title: "保存できませんでした", message: "1000以下の数字を入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
            TextField.text = ""
        } else {
            ScoreArray.append (Int(TextField.text!)!)
            saveData.set(ScoreArray, forKey: "\(label1.text)scores")
            TextField.text = ""
            let alert: UIAlertController = UIAlertController(title: "保存", message: "保存しました", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKボタンが押されました")}))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScores" {
            let ScoreVC: ScoresViewController = segue.destination as! ScoresViewController
            ScoreVC.ScoreArray = self.ScoreArray
            ScoreVC.text = self.label1.text
        } else if segue.identifier == "toNotes" {
            let NotesVC: NotesViewController = segue.destination as! NotesViewController
            NotesVC.recieveValue = self.value
            NotesVC.text = self.label1.text
        }
    }
    
    let saveData: UserDefaults = UserDefaults.standard
    
}
