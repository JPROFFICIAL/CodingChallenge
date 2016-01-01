//
//  ChartViewController.swift
//  iOSChallenge1230
//
//  Created by Jordan Olson on 12/31/15.
//  Copyright © 2015 JPRODUCTION. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
    
    @IBOutlet weak var pieChartViewOne: PieChartView!
    
    @IBOutlet weak var chartNameOne: UILabel!
    @IBOutlet weak var chartNameTwo: UILabel!
    @IBOutlet weak var chartNameThree: UILabel!
    @IBOutlet weak var chartNameFour: UILabel!
    @IBOutlet weak var chartNameFive: UILabel!
    
    @IBOutlet weak var chartNumberOne: UILabel!
    @IBOutlet weak var chartNumberTwo: UILabel!
    @IBOutlet weak var chartNumberThree: UILabel!
    @IBOutlet weak var chartNumberFour: UILabel!
    @IBOutlet weak var chartNumberFive: UILabel!
    
    @IBOutlet weak var chartColorOne: UIView!
    @IBOutlet weak var chartColorTwo: UIView!
    @IBOutlet weak var chartColorThree: UIView!
    @IBOutlet weak var chartColorFour: UIView!
    @IBOutlet weak var chartColorFive: UIView!
    
    
    override func viewDidLoad() {
        
        let userNumbers = [32.0,43.0,21.0,12.0,10.0]
        
        setChart(userNumbers)
        pieChartViewOne.animate(xAxisDuration: 1.5)
        pieChartViewOne.centerText = "Add Num"
        
        
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: "goBackSwipe:")
        edgePan.edges = .Left
        
        view.addGestureRecognizer(edgePan)

        
    }
    
    func goBackSwipe(recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .Recognized {
            
        performSegueWithIdentifier("returnToDash", sender: nil)
        }
    }

    
    func setChart(values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<values.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Active Users")
        let pieChartData = PieChartData(xVals: values, dataSet: pieChartDataSet)
        pieChartViewOne.data = pieChartData
        
        var colors: [UIColor] = []
        
        
        for i in 0..<values.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        
        }
        
        pieChartDataSet.colors = colors
        chartColorOne.backgroundColor = colors[0]
        chartColorTwo.backgroundColor = colors[1]
        chartColorThree.backgroundColor = colors[2]
        chartColorFour.backgroundColor = colors[3]
        chartColorFive.backgroundColor = colors[4]
        pieChartDataSet.sliceSpace = 5
    }
    
}
