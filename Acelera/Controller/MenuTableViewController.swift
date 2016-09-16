//
//  MenuTableViewController.swift
//  Acelera
//
//  Created by mac on 5/11/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
//import TexiOrder

class MenuTableViewController: UIViewController{
    
     @IBOutlet var tableView: UITableView!
     @IBOutlet weak var btnmenu: UIBarButtonItem!
    
    // var tableData: [String] = ["Translate", "Travel log", " log in", "Share"," About"," log out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if self.revealViewController() != nil {
//            btnmenu.target = self.revealViewController()
//            btnmenu.action = Selector("revealToggle:")
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }

        
        
//        // Register custom cell
//        let nib = UINib(nibName: "MenuTableCell", bundle: nil)
//        tableView.registerNib(nib, forCellReuseIdentifier: "cell")

    }
    
//    // 2
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.tableData.count
//    }
//    
//    
//    // 3
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
//        
//        let cell:MenuTableCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! MenuTableCell
//        
//        cell.lbl.text = tableData[indexPath.row]
//        cell.img.image = UIImage(named: tableData[indexPath.row])
//        
//        return cell
//        
//    }
    
    // 4
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("Row \(indexPath.row) selected")
//        if(indexPath.row==0){
//            
//        }
//        else if(indexPath.row==1){
//            
//        }
//        
//        else if(indexPath.row==2){
//            
//        }
//        else if(indexPath.row==3){
//            
//        }
//        else if(indexPath.row==4){
//            
//        }
//    }
//    
//    // 5
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 40
//    }
//    
// 
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
}
