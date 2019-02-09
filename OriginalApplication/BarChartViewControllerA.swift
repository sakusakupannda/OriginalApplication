//
//  BarChartViewControllerA.swift
//  Count
//
//  Created by 今泉櫻子 on 2018/11/03.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit
import Charts

class BarChartViewControllerA: UIViewController {
    
    @IBOutlet var barChartView: BarChartView!
    var Array: [String]! //教科名
    var ArrayAB: [Int]! = [0,0,0,0,0,0,0,0,0,0]
    var datapointsA: [String]! = []
    var entry: [Double] = [] //点数
    let saveData: UserDefaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        Array = []
        Array = saveData.object(forKey: "name") as? [String]
        
        for i in 1..<ArrayAB.count {
            var avg2: Double = 0
            saveData.register(defaults: ["\(Array[i])avg2" : 0.0])
            avg2 = saveData.object(forKey: "\(Array[i])avg2") as! Double
            if ArrayAB[i] == 0 {
                entry.append(avg2)
                datapointsA?.append("\(Array[i])")
            }
        }
        saveData.set(datapointsA, forKey: "datapointsA")
        
        if datapointsA.count == 0 {
            datapointsA = [""]
        }
        if entry.count == 0 {
            entry = [0]
        }
        
        entry.insert(0, at: 0)
        self.setCharts(dataPoints: datapointsA, values: entry)
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("BarChartViewControllerA Will Appear")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    func setCharts(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "データがありません。"
        var dataEntries: [BarChartDataEntry] = []

        for i in 1..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(entry[i])]) //グラフ１つの座標
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(values: dataEntries, label: "点数") //グラフの色、影など
        chartDataSet.valueFormatter = Formatter() as? IValueFormatter

        chartDataSet.drawValuesEnabled = true //バーのラベル表示
        barChartView.xAxis.valueFormatter = BarChartFormatterA()//x軸のラベルを設定
        barChartView.xAxis.labelPosition = .bottom //x軸のラベルをボトムに表示
        barChartView.xAxis.labelCount = 6 //x軸のラベル数を設定(設定しない場合のラベル数は6)
        barChartView.xAxis.drawGridLinesEnabled = false //x軸の縦線を表示しない
        barChartView.rightAxis.axisMinimum = 0.0 //yの最低値を0に設定
        barChartView.leftAxis.axisMinimum = 0.0 //yの最低値を0に設定
        barChartView.animate(yAxisDuration: 2.0) //アニメーションをつける
        barChartView.pinchZoomEnabled = true //ピンチズームが可能か
        barChartView.drawBarShadowEnabled = false //バーの背景をグレーにする
        barChartView.drawBordersEnabled = true //周りの枠組みが色濃くなる
        barChartView.rightAxis.drawLabelsEnabled = false //右ラベルを非表示

        let chartData = BarChartData(dataSets: [chartDataSet]) //グラフの細かい範囲など
        barChartView.data = chartData
        chartDataSet.colors = ChartColorTemplates.material()
    }

    
    @IBAction func reset (){
        barChartView.zoomOut()
    }
    
    @IBAction func back() {
        let next = storyboard!.instantiateViewController(withIdentifier: "All")
        self.present(next, animated: true, completion: nil)
//        if self.title != "All" {
//            self.dismiss(animated: true, completion: nil)
//        }
    }


    
    private func add(asChildViewController viewController: UIViewController) {
        // 子ViewControllerを追加
        addChild(viewController)
        // Subviewとして子ViewControllerのViewを追加
        view.addSubview(viewController.view)
        // 子Viewの設定
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // 子View Controllerへの通知
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // 子View Controllerへの通知
        viewController.willMove(toParent: nil)
        // 子ViewをSuperviewから削除
        viewController.view.removeFromSuperview()
        // 子View Controllerへの通知
        viewController.removeFromParent()
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


//X軸の設定
class BarChartFormatterA: NSObject, IAxisValueFormatter{
    var datapointsA: [String] = []
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let saveData: UserDefaults = UserDefaults.standard
        saveData.register(defaults: ["datapointsA" : ""])
        datapointsA = saveData.object(forKey: "datapointsA") as! [String]
        return datapointsA[Int(value)]
    }
}

