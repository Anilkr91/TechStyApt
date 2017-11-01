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
    @IBOutlet weak var rateScaleSegmentControl: UISegmentedControl!
    
//    var rating: [GoalOfTheMonthRating] = []
    var months: [String] = []
    var unitsSold: [Double] = []
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    var info: [GoalOfTheMonthRating]? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
    
    func didSetCategory(_ info: [GoalOfTheMonthRating]) {
        
        if info.count == 0 {
            
            months = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"]
            unitsSold = [0, 2, 3, 4, 5, 6, 7]
            
        } else {
            
            for day in info.enumerated() {
                
                if day.element.day == "Sunday" {
                  
                     months.insert("Sun", at: 0)
                     unitsSold.insert(Double(day.element.value)!, at: 0)
                
                } else {
                    months.insert("Sun", at: 0)
                    unitsSold.insert(0, at: 0)
                }
                
                if day.element.day == "Monday" {
                    months.insert("Mon", at: 1)
                    unitsSold.insert(Double(day.element.value)!, at: 1)

                    
                } else {
                    
                    months.insert("Mon", at: 1)
                    unitsSold.insert(0, at: 1)

                }
                
                 if day.element.day == "Tuesday" {
                   
                    months.insert("Tue", at: 2)
                    unitsSold.insert(Double(day.element.value)!, at: 2)
                    
                 } else {
                    
                    months.insert("Tue", at: 2)
                    unitsSold.insert(0, at: 2)
                
                }
                 
                if day.element.day == "Wednesday" {
                    months.insert("Wed", at: 3)
                    unitsSold.insert(Double(day.element.value)!, at: 3)
                    
                } else {
                    
                    months.insert("Wed", at: 3)
                    unitsSold.insert(0, at: 3)
                }
                
                if day.element.day == "Thursday" {
                    
                    
                    months.insert("Thurs", at: 4)
                    unitsSold.insert(Double(day.element.value)!, at: 4)
                    
                    
                    
                } else {
                    
                    months.insert("Thurs", at: 4)
                    unitsSold.insert(0, at: 4)
                    
                }
                
                
                if day.element.day == "Friday" {
                
                    months.insert("Fri", at: 5)
                    unitsSold.insert(Double(day.element.value)!, at: 5)
                    
                    
                } else {
                    
                    months.insert("Fri", at: 5)
                    unitsSold.insert(0, at: 5)
                   
                }
                
                if day.element.day == "Saturday" {
                    
                    months.insert("Sat", at: 6)
                    unitsSold.insert(Double(day.element.value)!, at: 6)
                    
                } else {
                    
                    months.insert("Sat", at: 6)
                    unitsSold.insert(0, at: 6)

                }
            }
        }
        
        setupRateGraph()
        setupSegmentControl()
    }
}

extension GoalOfTheMonthRateCell {
    
    func setupRateGraph() {
        axisFormatDelegate = self
     
        chart.rightAxis.drawLabelsEnabled = false
        chart.chartDescription?.text = ""
        
        
        let  xAxis : XAxis = self.chart.xAxis
        xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 11.0)!
        
        xAxis.drawGridLinesEnabled = true
        chart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        let  yAxis : YAxis = self.chart.leftAxis
        yAxis.axisMaximum = 10
        yAxis.axisMinimum = 0
        yAxis.labelCount = 10
        yAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 11.0)!
        
        self.chart.rightAxis.drawLabelsEnabled = false
        
        chart.chartDescription?.text = ""
        setChart(dataEntryX: months, dataEntryY: unitsSold)
    }
    
    func setChart(dataEntryX forX:[String],dataEntryY forY: [Double]) {
        
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
    
    func setupSegmentControl() {
        rateScaleSegmentControl.addTarget(self, action: #selector(segmentIndex), for: .valueChanged)
    }
    
    
    func segmentIndex(_ sender: UISegmentedControl?) {
        
        let rate = sender!.selectedSegmentIndex + 1
        
         let param = ["userId": "22", "rate_self" : rate ] as [String: AnyObject]
        
        UpdateGoalOfTheMonthRateYourselfPostService.executeRequest(param) { (data) in
            print(data)
        }
    }
}
