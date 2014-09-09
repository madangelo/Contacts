//
//  ContactDetails.swift
//  Contacts
//
//  Created by Michael D'Angelo on 9/7/14.
//  Copyright (c) 2014 Michael D'Angelo. All rights reserved.
//

import UIKit

class ContactDetails: UIViewController {
    
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneLabel: UILabel!
    
    var contactName = ""
    var contactPhone = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contactNameLabel.text = contactName
        contactPhoneLabel.text = contactPhone
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
