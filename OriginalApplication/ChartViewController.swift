//
//  ChartViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2018/10/20.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
     @IBOutlet weak var barChartView: BarChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let unitsSold = ScoreArray
        
        barChartView.animate(yAxisDuration: 2.0)
        barChartView.pinchZoomEnabled = false
        barChartView.drawBarShadowEnabled = false
        barChartView.descriptionText = "CHART"
        
        setChart(dataPoints: mount_t, values: unitsSold)
        

        // Do any additional setup after loading the view.
    }
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "score")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
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
