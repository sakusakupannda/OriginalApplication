//
//  LineChartViewController.swift
//  Count
//
//  Created by 今泉櫻子 on 2018/11/03.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {
    
    @IBOutlet var lineChartView: LineChartView!
    var datapoints: [Int]! = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41]
    var ScoreArray: [Double]! //点数
    var text: String!
    let saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(ScoreArray)
        print(datapoints)
        ScoreArray = saveData.object(forKey: "\(text!)scores") as? [Double]
        self.setCharts(dataPoints: datapoints, values: ScoreArray)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setCharts(dataPoints: [Int], values: [Double]) {
        //lineChartView.noDataText = "データがありません。"
        var lineChartEntries: [ChartDataEntry] = []
        
        print(ScoreArray.count)
        print(datapoints.count)
        
        
        if dataPoints.count <= ScoreArray.count {
            for i in 0..<dataPoints.count {
                let dataEntry = ChartDataEntry(x: Double(i+1), y: ScoreArray[i]) //グラフ１つの座標
                lineChartEntries.append(dataEntry)
                datapoints.append(i)
                print(i)
            }
        } else if ScoreArray.count < dataPoints.count {
            for i in 0..<ScoreArray.count {
                let dataEntry = ChartDataEntry(x: Double(i+1), y: ScoreArray[i]) //グラフ１つの座標
                lineChartEntries.append(dataEntry)
                datapoints.append(i)
                print(i)
            }
        }
    
        
        let chartDataSet = LineChartDataSet(values: lineChartEntries, label: "点数") //グラフの色、影など
        chartDataSet.valueFormatter = Formatter() as? IValueFormatter
        
        chartDataSet.drawValuesEnabled = true //バーのラベル表示
        lineChartView.xAxis.labelPosition = .bottom //x軸のラベルをボトムに表示
        lineChartView.xAxis.labelCount = 6 //x軸のラベル数を設定(設定しない場合のラベル数は6)
        lineChartView.xAxis.drawGridLinesEnabled = false //x軸の縦線を表示しない
        //lineChartView.rightAxis.axisMinimum = 0.0 //yの最低値を0に設定
        //lineChartView.leftAxis.axisMinimum = 0.0 //yの最低値を0に設定
        if ScoreArray.count <= 4 {
            lineChartView.animate(yAxisDuration: 0) //アニメーションをつける
        } else {
            lineChartView.animate(yAxisDuration: 1.2) //アニメーションをつける
        }
        lineChartView.pinchZoomEnabled = false //ピンチズームが可能か
        lineChartView.drawBordersEnabled = true //周りの枠組みが色濃くなる
        lineChartView.rightAxis.drawLabelsEnabled = false //右ラベルを非表示
        //lineChartView.borderColor = UIColor.lightGray //枠線の色
        //lineChartView.drawBordersEnabled = true//わからん
        //lineChartView.tintColor = UIColor.red//わからん
        
        let chartData = LineChartData(dataSets: [chartDataSet]) //グラフの細かい範囲など
        
        lineChartView.data = chartData
        chartDataSet.colors = ChartColorTemplates.pastel()
        chartDataSet.circleColors = ChartColorTemplates.pastel()
    }
    
    @IBAction func reset (){
        lineChartView.zoomOut()
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
