//
//  BarChartsViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2019/01/25.
//  Copyright © 2019年 今泉櫻子. All rights reserved.
//

import UIKit
import Charts

class BarChartsViewController: UIViewController {
    
    private lazy var sample1ViewController: BarChartViewControllerA = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "A") as! BarChartViewControllerA
        addChild(viewController)
        return viewController
    }()
    
    private lazy var sample2ViewController: BarChartViewControllerB = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "B") as! BarChartViewControllerB
        addChild(viewController)
        return viewController
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(sample1ViewController.view)
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            if isFirstResponder == true {
                print(0)
                sample2ViewController.removeFromParent()
                self.view.addSubview(sample1ViewController.view)
            } else {
                print(0)
                sample2ViewController.removeFromParent()
                self.view.addSubview(sample1ViewController.view)
                //sample1ViewController.loadView()
                //sample1ViewController.viewDidLoad()
            }
        case 1:
            if isFirstResponder == true {
                print(1)
                sample1ViewController.removeFromParent()
                self.view.addSubview(sample2ViewController.view)
            } else {
                print(1)
                sample1ViewController.removeFromParent()
                self.view.addSubview(sample2ViewController.view)
                //sample2ViewController.loadView()
                //sample2ViewController.viewDidLoad()
            }
        default:
            print("error")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
