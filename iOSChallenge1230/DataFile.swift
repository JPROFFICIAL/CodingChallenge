//
//  DataFile.swift
//  iOSChallenge1230
//
//  Created by Jordan Olson on 12/31/15.
//  Copyright © 2015 JPRODUCTION. All rights reserved.
//

import Foundation
import Alamofire

class Transactions {

    private var _idNumber: Int!
    private var _firstName: String!
    private var _lastName: String!
    private var _fullName: String!
    private var _email: String!
    private var _amount: String! //USD DOLLARS
    private var _phone: String!
    private var _notifications: Int!
    private var _profileImage: Int!
    
    
    var idNumber: Int {
        if _idNumber == nil {
            _idNumber = 0
        }
            return _idNumber
    }
    
    var firstName: String {
        if _firstName == nil {
            _firstName = ""
        }
            return _firstName
    }
    
    var lastName: String {
        if _lastName == nil {
            _lastName = ""
        }
            return _lastName
    }
    
    var fullName: String {
        if _fullName == nil {
            _fullName = ""
        }
            return _fullName
    }
    
    var email: String {
        if _email == nil {
            _email = ""
        }
        return _email
    }
    
    var amount: String {
        if _amount == nil {
            _amount = ""
        }
        return _amount
    }
    
    var phone: String {
        if _phone == nil {
            _phone = ""
        }
        return _phone
    }
    
    var notifications: Int {
        return _notifications
    }
    
    var profileImg: Int {
        return _profileImage
    }
    
    init(notifications: Int) {
        _notifications = notifications
    }
    
    func downloadUserDetails(completed: DownloadComplete) {
        
        let getUserParams = [ "method": "chart", //"id":2
        ]
        
//        Alamofire.request(.POST, "https://www.thesoloconnection.com/demo/", parameters: getUserParams)
//            .responseString { response in
//                print(response.request)
//                print(response.response)
//                print(response.result.value)
//        }

        Alamofire.request(.POST, "https://www.thesoloconnection.com/demo/", parameters: getUserParams)
            .responseString { response in
            print(response.request)
            print(response.response)
            print(response.result.value)
        }
    
        completed()
    }
    
}