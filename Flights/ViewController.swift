//
//  ViewController.swift
//  Flights
//
//  Created by Jan Vrzal on 25.02.16.
//  Copyright © 2016 OhYeahSoft. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var segmentedControll: UISegmentedControl!
  
    @IBOutlet weak var tableView: UITableView!
    
    let jsonHandler = JSONHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registering tableView Cell
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
    
        // Segmented Controll
        
        let items = ["Arrivals", "Price"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 1
        
        navigationController?.navigationBar.topItem?.titleView = customSC
        navigationController?.navigationBar.translucent = false
        
        customSC.addTarget(self, action: "sortFunc:", forControlEvents: .ValueChanged)
       
        jsonHandler.getData()
        
        
    }
  
    // TableView DataSource methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return jsonHandler.flightsInfoArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        
       
        let cell:TableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        
        cell.dateLabel.text = "\(jsonHandler.timeStringFromUnixTime(jsonHandler.flightsInfoArray[indexPath.row].0))"
        
        cell.flightsFromLabel.text = jsonHandler.flightsInfoArray[indexPath.row].1
        
        cell.flightsToLabel.text = jsonHandler.flightsInfoArray[indexPath.row].2
        
        cell.priceLabel.text = "\(jsonHandler.flightsInfoArray[indexPath.row].3) E"
        
        return cell
    }
    
    
    // Sorting Function
    
    func sortFunc(sender:UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 1{
            jsonHandler.flightsInfoArray.sortInPlace({p1, p2 in p1.price < p2.price})  // Sorting array by price
            tableView.reloadData()
            
        }else if sender.selectedSegmentIndex == 0{
            jsonHandler.getData()
            jsonHandler.flightsInfoArray.sortInPlace({p1, p2 in p1.time < p2.time})    // Sorting array by time
         tableView.reloadData()
            
        }else{
        print("fail")
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}