//
//  DataFile.swift
//  iOSChallenge1230
//
//  Created by Jordan Olson on 12/31/15.
//  Copyright © 2015 JPRODUCTION. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Transactions {

    private var _idNumber: String!
    private var _firstName: String!
    private var _lastName: String!
    private var _fullName: String!
    private var _email: String!
    private var _amount: Int! //USD DOLLARS
    private var _total: Int! //TOTAL AMOUNTS
    private var _phone: String!
    private var _notifications: Int!
    private var _profileImage: Int!
    
    
    var idNumber: String {
            return _idNumber
    }
    
    var firstName: String {
            return _firstName
    }
    
    var lastName: String {
            return _lastName
    }
    
    var fullName: String {
            return _fullName
    }
    
    var email: String {
        return _email
    }
    
    var amount: Int {
        return _amount
    }
    
    var total: Int {
         return _total
    }
    
    var phone: String {
        return _phone
    }
    
    var notifications: Int {
        return _notifications
    }
    
    var profileImg: Int {
        return _profileImage
    }
    
    var chartNumbers = "\(0...5)"
    var chartFullNames = [[String: AnyObject]]()
    
    var chartNames:[String] = []
    var chartIds:[String] = []
    var chartAmount:[Int] = []
        
    
//    func parseJSON(json: JSON) {
//        for result in json["data"]["total"].arrayValue {
//            _fullName = result["fullname"].stringValue
//            _amount = result["amount"].intValue
//            _idNumber = result["id"].stringValue
//            let chartstuff = ["fullname": _fullName, "amount": _amount, "id": _idNumber]
//            print(chartstuff)
//            
//            
//        }
//    }
    
    
    
    func downloadChartDetails(completed: DownloadComplete) {
        
        let getUserParams = [ "method": "chart" ]
        
        Alamofire.request(.POST, "https://www.thesoloconnection.com/demo/", parameters: getUserParams)
            .responseString { response in
            let chartData = response.result.value
                
                if let data = chartData?.dataUsingEncoding(NSUTF8StringEncoding) {
                    let json = JSON(data: data)
                    
                    print(json)
                    if json["data"]["0"]["fullname"] != "" {
//                        print(json["data"]["0"]["fullname"])
//                        print(json["data"]["0"]["id"])
//                        print(json["data"]["0"]["amount"])
                        
                        self._fullName = json["data"]["0"]["fullname"].stringValue
                        self._idNumber = json["data"]["0"]["id"].stringValue
                        self._amount = json["data"]["0"]["amount"].intValue
                        
                        self.chartNames.append(json["data"]["0"]["fullname"].stringValue)
                        self.chartIds.append(json["data"]["0"]["id"].stringValue)
                        self.chartAmount.append(json["data"]["0"]["amount"].intValue)
                        
                        
                        
//                        print(self.chartNames)
//                        print(self._fullName)
//                        print(self._idNumber)
//                        print(self._amount)
            
                    }
                    
                    if json["data"]["1"]["fullname"] != "" {
                        
                        self._fullName = json["data"]["1"]["fullname"].stringValue
                        self._idNumber = json["data"]["1"]["id"].stringValue
                        self._amount = json["data"]["1"]["amount"].intValue
                        self.chartNames.append(json["data"]["1"]["fullname"].stringValue)
                        self.chartIds.append(json["data"]["1"]["id"].stringValue)
                        self.chartAmount.append(json["data"]["1"]["amount"].intValue)
                        
                    }
                    
                    if json["data"]["2"]["fullname"] != "" {
                        
                        self.chartNames.append(json["data"]["2"]["fullname"].stringValue)
                        self.chartIds.append(json["data"]["2"]["id"].stringValue)
                        self.chartAmount.append(json["data"]["2"]["amount"].intValue)
                        
                    }
                    
                    if json["data"]["3"]["fullname"] != "" {
                        
                        self.chartNames.append(json["data"]["3"]["fullname"].stringValue)
                        self.chartIds.append(json["data"]["3"]["id"].stringValue)
                        self.chartAmount.append(json["data"]["3"]["amount"].intValue)
                        
                    }
                    
                    if json["data"]["4"]["fullname"] != "" {
                        
                        self.chartNames.append(json["data"]["4"]["fullname"].stringValue)
                        self.chartIds.append(json["data"]["4"]["id"].stringValue)
                        self.chartAmount.append(json["data"]["4"]["amount"].intValue)
                                            
                    }
                    
                    if json["data"]["total"] != 0 {
                        self._total = json["data"]["total"].intValue
                    }
                    
                    print(self.chartNames)
                    print(self.chartIds)
                    print(self.chartAmount)
                    print(self.total)
                }
                
        }
        
        completed()
    }
    
    
    func downloadUserDetails(completed: DownloadComplete) {
        
        let getUserParams = [ "method": "get_user", "id":idNumber ]
        
//        Alamofire.request(.POST, "https://www.thesoloconnection.com/demo/", parameters: getUserParams as! [String : AnyObject])
//            .responseString { response in
//                print(response.request)
//                print(response.response)
//                print(response.result.value)
//        }
//        
//        completed()
//    }
        }
    
    
    func downloadDashboardDetails(completed: DownloadComplete) {
        
        let getUserParams = [ "method": "dashboard" ]
        
        Alamofire.request(.POST, "https://www.thesoloconnection.com/demo/", parameters: getUserParams)
            .responseString { response in
                print(response.request)
                print(response.response)
                print(response.result.value)
        }
        
        completed()
    }
    
    func downloadSearchDetails(completed: DownloadComplete) {
        
        let getUserParams = [ "method": "search" ]
        
        Alamofire.request(.POST, "https://www.thesoloconnection.com/demo/", parameters: getUserParams)
            .responseString { response in
                print(response.request)
                print(response.response)
                print(response.result.value)
                
                
                
        }
        
        completed()
        
        
        }
    
    }
