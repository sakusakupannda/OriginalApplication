//
//  BarChartViewController.swift
//  Count
//
//  Created by 今泉櫻子 on 2018/11/03.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {
    
    @IBOutlet var barChartView: BarChartView!
    var Array: [String]! //教科名
    var entry: [Double] = [] //点数
    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        Array = []
        Array = saveData.object(forKey: "name") as? [String]
        print(Array)
        
//        if isFirstResponder == false {
//            saveData.set(entry, forKey: "\(text!)scores")
//            ScoreArray = saveData.object(forKey: "\(text!)scores") as? [Double]
//        }
        
        for i in 1..<Array.count {
            entry = saveData.object(forKey: "\(Array[i])avg") as! [Double]
            entry.insert(0, at: 0)
        }
        
        
        self.setCharts(dataPoints: Array, values: entry)
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    func setCharts(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "データがありません。"
        var dataEntries: [BarChartDataEntry] = []

        for i in 1..<dataPoints.count {
            print(entry[i])
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(entry[i])]) //グラフ１つの座標
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "点数") //グラフの色、影など
        chartDataSet.valueFormatter = Formatter() as? IValueFormatter
        
        chartDataSet.drawValuesEnabled = true //バーのラベル表示
        barChartView.xAxis.valueFormatter = BarChartFormatter()//x軸のラベルを設定
        barChartView.xAxis.labelPosition = .bottom //x軸のラベルをボトムに表示
        barChartView.xAxis.labelCount = 6 //x軸のラベル数を設定(設定しない場合のラベル数は6)
        barChartView.xAxis.drawGridLinesEnabled = false //x軸の縦線を表示しない
        barChartView.rightAxis.axisMinimum = 0.0 //yの最低値を0に設定
        barChartView.leftAxis.axisMinimum = 0.0 //yの最低値を0に設定
        barChartView.animate(yAxisDuration: 2.0) //アニメーションをつける
        barChartView.pinchZoomEnabled = false //ピンチズームが可能か
        barChartView.drawBarShadowEnabled = false //バーの背景をグレーにする
        barChartView.drawBordersEnabled = true //周りの枠組みが色濃くなる
        barChartView.rightAxis.drawLabelsEnabled = false //右ラベルを非表示
        
        let chartData = BarChartData(dataSets: [chartDataSet]) //グラフの細かい範囲など
        
        barChartView.data = chartData
    }

    @IBAction func reset (){
        barChartView.zoomOut()
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
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


class BarChartFormatter: NSObject, IAxisValueFormatter{
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let saveData: UserDefaults = UserDefaults.standard
        var datapoints: [String] = saveData.object(forKey: "name") as! [String]
        print(datapoints)
        return datapoints[Int(value)]
        //X軸の設定
    }
}
