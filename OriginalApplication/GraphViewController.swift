//
//  BarChartViewController.swift
//  Count
//
//  Created by 今泉櫻子 on 2018/11/03.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit
import Charts

class GraphChartViewController: UIViewController {
    
    @IBOutlet var graphChartView: BarChartView!
    var dataPoints: [String]!
    var y: [Double] = []
    var ScoreArray: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        y = ScoreArray
        
        // Do any additional setup after loading the view.
        graphChartView.animate(yAxisDuration: 2.0)  //軸の長さ
        graphChartView.pinchZoomEnabled = false  //拡大
        graphChartView.drawBarShadowEnabled = false
        graphChartView.drawBordersEnabled = true
        //barChartView.
        
        setCharts(dataPoints: dataPoints, values: y)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setCharts(dataPoints: [String], values: [Double]) {
        graphChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(y[i])])
            //グラフ１つの座標
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "点数")
        let chartData = BarChartData(dataSets: [chartDataSet])
        graphChartView.data = chartData
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
