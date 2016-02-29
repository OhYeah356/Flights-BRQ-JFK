//
//  JSONHandler .swift
//  Flights
//
//  Created by Jan Vrzal on 29.02.16.
//  Copyright © 2016 OhYeahSoft. All rights reserved.
//

import UIKit

class JSONHandler{
    
    // Contains data from JSON
    var flightsInfoArray: [(time: Double,flyFrom: String,flyTo: String, price: Int)] = []
    
    
    // Getting data from JSON
    func getData(){
    
        let flightsJSON = NSBundle.mainBundle().pathForResource("flights", ofType: "json")
    
        let jsonData = NSData(contentsOfFile: flightsJSON!)
        
        
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: .AllowFragments)
            if let flightsInfo = object as? [String: AnyObject]{
    
    
                let flightsArray = flightsInfo["data"] as! NSArray
    
                for i in flightsArray{
    
    
                    if let time = i["dTime"] as? Double, flyFrom = i["flyFrom"] as? String, flyTo = i["flyTo"] as? String, price = i["price"] as? Int{
    
                        flightsInfoArray.append(time: time,flyFrom: flyFrom,flyTo: flyTo,price: price)
    
                    }
    
                }
    
            }
        } catch{
    // Error handling
            
        }
    }
    
    // Converting date from unix
    
    func timeStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        let formater = NSDateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        
        return formater.stringFromDate(date)
    }
    
    
}