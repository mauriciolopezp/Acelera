//
//  TravelLogViewController.swift
//  Acelera
//
//  Created by Test on 08/06/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class TravelLogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var TraveltableView: UITableView!
    @IBOutlet weak var btnmenu: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
                if self.revealViewController() != nil {
                    btnmenu.target = self.revealViewController()
                    btnmenu.action = Selector("revealToggle:")
                    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                }


        // Do any additional setup after loading the view.
        
        
        // Register custom cell
        let nib = UINib(nibName: "TravelLogCell", bundle: nil)
        TraveltableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }
    
    
    // 2
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    // 3
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
        
        let cell:TravelLogCell = self.TraveltableView.dequeueReusableCellWithIdentifier("cell") as! TravelLogCell
        
//        cell.lblCarName.text = tableData[indexPath.row]
//        cell.imgCarName.image = UIImage(named: tableData[indexPath.row])
        
        return cell
        
    }
    
    // 4
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row \(indexPath.row) selected")
    }
    
    // 5
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 72
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
