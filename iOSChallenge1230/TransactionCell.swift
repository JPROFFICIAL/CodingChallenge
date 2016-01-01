//
//  TransactionCell.swift
//  iOSChallenge1230
//
//  Created by Jordan Olson on 12/31/15.
//  Copyright © 2015 JPRODUCTION. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    @IBOutlet weak var contactImg: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerPhone: UILabel!

    var userTransaction: Transactions!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func configureCell(transactions: Transactions) {
        self.userTransaction = transactions
    }

}
