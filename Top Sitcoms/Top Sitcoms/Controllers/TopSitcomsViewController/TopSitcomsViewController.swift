//
//  ViewController.swift
//  Top Sitcoms
//
//  Created by Hossam Ghareeb on 1/18/15.
//  Copyright (c) 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

class TopSitcomsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var sitcoms = [Sitcom]()
    
    @IBOutlet weak var sitcomsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        // Do any additional setup after loading the view, typically from a nib.
        self.title = NSLocalizedString("homeTitle",comment: "Most Popular Sitcom")
        
        
        let manager = SitcomManager()
        self.sitcoms = manager.getTop5Sitcoms()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDatasource -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.sitcoms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        let sitcom = self.sitcoms[indexPath.row]
        
        cell.textLabel.text = sitcom.name
        cell.detailTextLabel?.text = "\(sitcom.getFormattedYear()) - \(sitcom.getFormattedRankDesc())"
        
        return cell
    }

    
}

