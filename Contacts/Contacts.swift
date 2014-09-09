//
//  Contacts.swift
//  Contacts
//
//  Created by Michael D'Angelo on 9/7/14.
//  Copyright (c) 2014 Michael D'Angelo. All rights reserved.
//

import UIKit

class Contacts: UITableViewController, dataUpdated{
    
    
    struct contactInfo {
        var name: String
        var phoneNumber: String
    }
    
    var listOfContacts: [contactInfo] = []
    
    var firstContact = contactInfo(name: "John Coffey" , phoneNumber: "(111) 111-1111")
    var secondContact = contactInfo(name: "Cathy Kane" , phoneNumber: "(222) 222-2222")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
            self.navigationItem.leftBarButtonItem = self.editButtonItem()
            
            listOfContacts.append(firstContact)
            listOfContacts.append(secondContact)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: (UITableView!)) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: (UITableView!), numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return listOfContacts.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("contact", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = listOfContacts[indexPath.row].name
        cell.detailTextLabel?.text = listOfContacts[indexPath.row].phoneNumber
        
        return cell
        
    }
    
    
    //Passing details to detail VC
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        
        if segue.identifier == "toDetail" {
            
            let indexPath = self.tableView.indexPathForSelectedRow()
            let theSelectedRow = listOfContacts[indexPath!.row]
            let theDestination = (segue.destinationViewController as ContactDetails)
            
            
            theDestination.contactName = theSelectedRow.name
            theDestination.contactPhone = theSelectedRow.phoneNumber
            
        }
        
        else if segue.identifier == "toInput"
        
        {
            (segue.destinationViewController as ContactInput).delegate = self
            
        }
    }
    
    
    func didUpdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String) {
        var newContact = contactInfo(name: aName, phoneNumber: aPhoneNumber)
        listOfContacts.append(newContact)
        
        self.tableView.reloadData()
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            listOfContacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {
        let fromContact = listOfContacts[fromIndexPath.row]
        listOfContacts.removeAtIndex(fromIndexPath.row)
        listOfContacts.insert(fromContact, atIndex: toIndexPath.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation
    
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
