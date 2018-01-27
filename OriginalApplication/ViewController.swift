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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
