//
//  ViewController.swift
//  iOSChallenge1230
//
//  Created by Jordan Olson on 12/30/15.
//  Copyright © 2015 JPRODUCTION. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var transactions = [Transactions]()
    var inSearchMode = false
    var filteredTransactions = [Transactions]()
    var userInfoTrans = Transactions()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("transactionCell", forIndexPath: indexPath) as? TransactionCell {
         
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        userInfoTrans.downloadUserDetails { () -> () in
            
        }
        
        }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //WILL CHANGE WHEN SWITCH EXTRA=1 IS ON
    }
    @IBAction func navigateToUserProfile(sender: AnyObject) {
    }
    @IBAction func navigateToCharts(sender: AnyObject) {
        
        performSegueWithIdentifier("showChartView", sender: nil)
    }
    @IBAction func okayAlertPopup(sender: AnyObject) {
    }
    @IBAction func scrollAlertPopup(sender: AnyObject) {
    }
    @IBAction func changeCellDirection(sender: AnyObject) {
    }
    @IBAction func addExtraTableViewCell(sender: AnyObject) {
    }
    
}
    




