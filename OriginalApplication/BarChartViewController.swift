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
    var months: [String]! = ["1月", "2月", "3月", "4月", "5月", "6月"]
    let unitsSold = [10, 10.5, 15, 17.2, 18, 19]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        barChartView.animate(yAxisDuration: 2.0)  //軸の長さ
        barChartView.pinchZoomEnabled = false  //拡大
        barChartView.drawBarShadowEnabled = false
        barChartView.drawBordersEnabled = true
        //barChartView.

        setCharts(dataPoints: months, values: unitsSold)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    func setCharts(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."

        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(i)])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(values: dataEntries, label: "降水量")
        let chartData = BarChartData(dataSets: [chartDataSet])
        barChartView.data = chartData
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
