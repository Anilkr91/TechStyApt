//
//  GoalOfTheMonthRateCell.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Charts

class  GoalOfTheMonthRateCell: UITableViewCell {
    
    @IBOutlet weak var chart: LineChartView!
    
    var rating: [GoalOfTheMonthRating] = []
    var months: [String]!
    var unitsSold: [Double] = []
    weak var axisFormatDelegate: IAxisValueFormatter?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupRateGraph()
    }
}

extension GoalOfTheMonthRateCell {
    
    func setupRateGraph() {
        
        print(rating)
        
        for rate in rating.enumerated(){
            print(rate)
            
            }
        
        axisFormatDelegate = self
        months = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"]
        unitsSold = [1, 2, 3, 0, 5, 6, 7, 8]
        
        chart.rightAxis.drawLabelsEnabled = false
        chart.chartDescription?.text = ""
        setChart(dataEntryX: months, dataEntryY: unitsSold, chart: chart)
    }
    
    func setChart(dataEntryX forX:[String],dataEntryY forY: [Double], chart: LineChartView) {
        
        chart.noDataText = "You need to provide data for the chart."
        var dataEntries:[BarChartDataEntry] = []
        for i in 0..<forX.count{
            
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: months as AnyObject?)
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Fitness chart")
        chartDataSet.setCircleColor(NSUIColor.red)
        chartDataSet.circleColors = [NSUIColor.red]
        chartDataSet.fillColor = UIColor.red
        chartDataSet.valueColors = [NSUIColor.red]
        chartDataSet.valueFont = UIFont(name: "Verdana", size: 10.0)!
        
        chartDataSet.colors = [NSUIColor.red]
        chartDataSet.circleRadius = 3
        chartDataSet.mode = .cubicBezier
        
        let chartData = LineChartData(dataSet: chartDataSet)
        chart.data = chartData
        let xAxisValue = chart.xAxis
        xAxisValue.valueFormatter = axisFormatDelegate
    }
}

extension GoalOfTheMonthRateCell: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return months[Int(value)]
    }
}
