//
//  SitcomManager.swift
//  Top Sitcoms
//
//  Created by Hossam Ghareeb on 1/20/15.
//  Copyright (c) 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

class Sitcom
{
    var name = ""
    var year = 0
    var rank:Float = 0
    
    init(name:String, year:Int, rank:Float)
    {
        self.name = name
        self.year = year
        self.rank = rank
    }
    
    func getFormattedRankDesc() -> String
    {
        let formatter = NSNumberFormatter();
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle;
        return "\(formatter.stringFromNumber(rank)!) / \(formatter.stringFromNumber(10)!)"
    }
    
    func getFormattedYear() -> String
    {
        let formatter = NSNumberFormatter();
        formatter.numberStyle = NSNumberFormatterStyle.NoStyle;
        return formatter.stringFromNumber(year)!;
    }
}

class SitcomManager {
    
    func getTop5Sitcoms() -> [Sitcom]
    {
        var topSitcoms = [Sitcom]()
        let sitcomsInfo = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("sitcomsInfo", ofType: "plist")!)
        let sitcoms = sitcomsInfo?.objectForKey("sitcoms") as NSArray
        for item in sitcoms
        {
            if let sitcomDic = item as? NSDictionary
            {
                let name = sitcomDic.objectForKey("name") as String
                let year = sitcomDic.objectForKey("year") as NSNumber
                let rank = sitcomDic.objectForKey("rank") as NSNumber
                
                let sitcom = Sitcom(name: name, year: year.integerValue, rank: rank.floatValue)
                topSitcoms.append(sitcom)
            }
        }
        
        return topSitcoms
    }
   
}
