//
//  MenuListTable.swift
//  menu_make
//
//  Created by 松土記士 on 2020/06/19.
//  Copyright © 2020 松土記士. All rights reserved.
//

import UIKit
import RealmSwift

class MenuListTable: UITableViewController {
    let realm = try! Realm()

    @IBOutlet var MenuTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MenuListCell", bundle: nil),forCellReuseIdentifier: "MenuCell")

        // Uncomment the following line to preserve selection between presentations
//        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func exit(segue:UIStoryboardSegue){
        
    }
    @IBAction func save(segue:UIStoryboardSegue){
        
    }
    override func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
          let menuModel = realm.objects(MenuModel.self)
          self.MenulistMenuplate = menuModel[indexPath.row].menuname
          performSegue(withIdentifier: "SozaiEditSegue",sender: nil)
             
         }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print(#function)
            
        if (segue.identifier == "SozaiEditSegue"){
//            let nav2 = segue.destination as! UINavigationController
//            let sozaiEdit = nav2.topViewController as! SozaiEditTable
            let sozaiEdit = segue.destination as! SozaiEditTable
            sozaiEdit.SozaiEditMenuname = self.MenulistMenuplate
        }
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let menuModel = realm.objects(MenuModel.self)
        return menuModel.count
    }

    var MenuList:Array<String> = []
    var MenulistMenuplate:String = ""
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuModel = realm.objects(MenuModel.self)
        for ix in 0..<menuModel.count{
            MenuList.self.append(menuModel[ix].menuname)
            print(MenuList)
        }
        let indexRow = indexPath.row
        switch indexRow{
        case 0:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuListCell
//            let cell = tableView.dequeueReusableCell(withIdentifier: "menu1", for: indexPath)
            if indexRow < menuModel.count {
                cell.textLabel?.text = (menuModel[indexRow].menuname )
                self.MenulistMenuplate = menuModel[indexRow].menuname
//                let label1 = cell.viewWithTag(indexRow) as! UILabel
//                label1.text = (menuModel[indexRow] as! String)
                return cell
            }else{
                cell.textLabel?.text = ""
//                let label1 = cell.viewWithTag(0) as! UILabel
//                label1.text = ""
                return cell
            }
        
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "menu1", for: indexPath)
            if indexPath.row < menuModel.count {
                cell.textLabel?.text = (menuModel[indexRow].menuname )
//                let label1 = cell.viewWithTag(indexRow) as! UILabel
//                label1.text = (MenuList[indexRow] as! String)
                return cell
            }else{
                cell.textLabel?.text = ""
//                let label1 = cell.viewWithTag(0) as! UILabel
//                label1.text = ""
                return cell
            }
        }
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
