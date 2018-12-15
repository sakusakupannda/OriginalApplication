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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEach" {
            let secondViewController: EachSubjectViewController = segue.destination as! EachSubjectViewController
            secondViewController.recieveValue = self.value
            secondViewController.Array = self.Array
        }
    }
}
