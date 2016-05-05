//
//  MyTableViewController.swift
//  ImagePicker
//
//  Created by zaktech on 4/27/16.
//  Copyright © 2016 zaktech. All rights reserved.
//

import UIKit

class Person {
    var name:String
    var age: Int
    
    init(name: String, age:Int) {
        self.name = name
        self.age = age
    }
}


class MyTableViewController: UITableViewController {
    
    var dataSource:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let person1 = Person(name: "Hanny", age: 28)
        let person2 = Person(name: "Asad", age: 27)
        let person3 = Person(name: "Kashif", age: 26)
        let person4 = Person(name: "Junaid", age: 32)
        let person5 = Person(name: "Ali", age: 48)
        let person6 = Person(name: "Raza", age: 53)
        let person7 = Person(name: "Haneef", age: 66)
        
        
        dataSource = [person1, person2, person3, person4, person5, person6, person7]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataSource.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myTableViewCellIdentifier", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = self.dataSource[indexPath.row].name
        cell.detailTextLabel?.text = String(self.dataSource[indexPath.row].age)
        cell.imageView?.image = UIImage(named: "rose_flower")
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 20.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let detailsVC = DetailsViewController()
//        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        
//        let myCell = sender as! UITableViewCell
//        let myIndexPath = tableView.indexPathForCell(myCell)
//        
//        let selectedPerson = self.dataSource[(myIndexPath!.row)]
//        
//        let myDetailVC = segue.destinationViewController as? DetailsViewController
//        myDetailVC?.titleString = selectedPerson
        
        
        if segue.identifier == "pushDetailVC" , let detailsVC = segue.destinationViewController as? DetailsViewController {
            if let cell = sender as? UITableViewCell, let indexPath  = tableView.indexPathForCell(cell) {
                
                let selectedPerson = self.dataSource[indexPath.row]
                detailsVC.titleString = selectedPerson
                
                //                let nameString = cell.textLabel?.text
                //                detailsVC.titleString = nameString
            }
        }
        
        
    }
    

}
