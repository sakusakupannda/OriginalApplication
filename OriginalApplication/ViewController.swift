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
    var Array: [String] = []
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        value = "Subject1"
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject2Button() {
        value = "Subject2"
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject3Button() {
        value = "Subject3"
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject4Button() {
        value = "Subject4"
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject5Button() {
        value = "Subject5"
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject6Button() {
        value = "Subject6"
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject7Button() {
        value = "Subject7"
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject8Button() {
        value = "Subject8"
        performSegue(withIdentifier: "toEach", sender: nil)
    }

    @IBAction func subject9Button() {
        value = "Subject9"
        performSegue(withIdentifier: "toEach", sender: nil)
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEach" {
            let secondViewController: EachSubjectViewController = segue.destination as! EachSubjectViewController
            secondViewController.recieveValue = self.value
        
        } else if segue.identifier == "toAll" {
            let secondViewController: AllSubjectsViewController = segue.destination as! AllSubjectsViewController
            secondViewController.recieveValue = self.value
        }
        
    }
}
