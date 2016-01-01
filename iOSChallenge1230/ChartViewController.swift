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
    
    var userInfoTrans = Transactions()
//    var userNumbers:[Int] = []
    var userNumbers = [34.0, 45.0, 32.0, 45.0, 32.0]
    
    override func viewDidLoad() {
        
        
        
        setChart(userNumbers)
        pieChartViewOne.animate(xAxisDuration: 1.5)
        pieChartViewOne.centerText = "198"
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: "goBackSwipe:")
        edgePan.edges = .Left
        
        view.addGestureRecognizer(edgePan)

        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        userInfoTrans.downloadChartDetails { () -> () in
            
//            self.chartNameOne.text = self.userInfoTrans.chartNames[0]
//            self.chartNumberOne.text = "\(self.userInfoTrans.chartAmount[0])"
////            self.userNumbers.append(self.userInfoTrans.chartAmount[0])
//            
//            if self.userInfoTrans.chartNames[1] != "" {
//            self.chartNameTwo.text = self.userInfoTrans.chartNames[1]
//            self.chartNumberTwo.text = "\(self.userInfoTrans.chartAmount[1])"
////            self.userNumbers.append(self.userInfoTrans.chartAmount[1])
//                
//            } else {
//                self.chartNameTwo.hidden = true
//                self.chartColorTwo.hidden = true
//                self.chartNumberTwo.hidden = true
//            }
//            
//            if self.userInfoTrans.chartNames[2] != "" {
//                self.chartNameThree.text = self.userInfoTrans.chartNames[2]
//                self.chartNumberThree.text = "\(self.userInfoTrans.chartAmount[2])"
////                self.userNumbers.append(self.userInfoTrans.chartAmount[2])
//            } else {
//                self.chartNameThree.hidden = true
//                self.chartColorThree.hidden = true
//                self.chartNumberThree.hidden = true
//            }
//
//            if self.userInfoTrans.chartNames[3] != "" {
//                self.chartNameFour.text = self.userInfoTrans.chartNames[3]
//                self.chartNumberFour.text = "\(self.userInfoTrans.chartAmount[3])"
////                self.userNumbers.append(self.userInfoTrans.chartAmount[3])
//            } else {
//                self.chartNameFour.hidden = true
//                self.chartColorFour.hidden = true
//                self.chartNumberFour.hidden = true
//            }
//
//            if self.userInfoTrans.chartNames[4] != "" {
//                self.chartNameFive.text = self.userInfoTrans.chartNames[4]
//                self.chartNumberFive.text = "\(self.userInfoTrans.chartAmount[4])"
////                self.userNumbers.append(self.userInfoTrans.chartAmount[4])
//            } else {
//                self.chartNameFive.hidden = true
//                self.chartColorFive.hidden = true
//                self.chartNumberFive.hidden = true
//            }

        }
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
