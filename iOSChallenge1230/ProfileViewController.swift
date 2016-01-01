//
//  ProfileViewController.swift
//  iOSChallenge1230
//
//  Created by Jordan Olson on 12/31/15.
//  Copyright © 2015 JPRODUCTION. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileEmail: UIImageView!
    @IBOutlet weak var profilePhoneNumber: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    
    override func viewDidLoad() {
        
        
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: "goBackSwipe:")
        edgePan.edges = .Left
        
        view.addGestureRecognizer(edgePan)

    }
    
    func goBackSwipe(recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .Recognized {
            
            performSegueWithIdentifier("returnToDashTwo", sender: nil)
        }
    }
    @IBAction func returnToDashboard(sender: AnyObject) {
        performSegueWithIdentifier("returnToDashTwo", sender: nil)
    }


}
