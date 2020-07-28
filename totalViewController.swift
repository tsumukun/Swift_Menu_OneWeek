//
//  totalViewViewController.swift
//  menu_make
//
//  Created by 松土記士 on 2020/05/31.
//  Copyright © 2020 松土記士. All rights reserved.
//

import UIKit
import RealmSwift

class totalViewController: UIViewController,UITableViewDataSource{
    let realm = try! Realm()
    
    
    @IBOutlet weak var Totaltable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Totaltable.dataSource = self
//        Totaltable.reloadData()
        // Do any additional setup after loading the view.
    }
    
    var buysozaiArray:Array<String> = []
    var buyArray:Array<String> = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("aaa:\(#function)")
        let Buytotal_count = realm.objects(Buy.self)
        let buycount = Buytotal_count.count
        for index in 0..<buycount{
            self.buysozaiArray.append(Buytotal_count[index].sozainame)
        }
        //重複を削除
        let orderedSet: NSOrderedSet = NSOrderedSet(array: self.buysozaiArray)
        // 再度Arrayに戻す
        buyArray = orderedSet.array as! [String]
        print(buyArray.count)
        return buyArray.count
        }
    
    func cellSet(ix:Int,cell:UITableViewCell,Buytotal:Results<Buy>){
           let label1 = cell.viewWithTag(1) as! UILabel
           let  buy_sozainame = Buytotal.filter("sozainame = '\(self.buyArray[ix])'")
           let  buy_sozainame_count = buy_sozainame.count
           label1.text = buy_sozainame[ix].sozainame
        print("\(ix)","\(label1.text)")
//            if self.labeltitle != buy_sozainame[0].sozainame{
           var kosu_total = 0
           for index in 0..<buy_sozainame_count{
               kosu_total += buy_sozainame[index].kosu
           }
           print(kosu_total)
           let label2 = cell.viewWithTag(2) as! UILabel
           label2.text = "\(kosu_total)"
           let label3 = cell.viewWithTag(3) as! UILabel
           label3.text = buy_sozainame[ix].tani
           let label4 = cell.viewWithTag(4) as! UILabel
           label4.text = buy_sozainame[ix].bunrui
       }
       
    func cellSetInit(cell:UITableViewCell){
               let label1 = cell.viewWithTag(1) as! UILabel
               label1.text = ""
               let label2 = cell.viewWithTag(2) as! UILabel
               label2.text = ""
               let label3 = cell.viewWithTag(3) as! UILabel
               label3.text = ""
               let label4 = cell.viewWithTag(4) as! UILabel
               label4.text = ""
           }
//    var labeltitle = ""
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("1\(#function)")
        let Buytotal = realm.objects(Buy.self)
        switch indexPath.row {
        case 0:
            if indexPath.row < buyArray.count{
            print("ここ通ってる？")
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total1",for:indexPath)
            cellSet(ix: 0, cell: cell, Buytotal: Buytotal)
            return cell
            }else{
                let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total1",for:indexPath)
                cellSetInit(cell: cell)
                return cell
            }
        case 1:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total2",for:indexPath)
            cellSet(ix: 1, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total2",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
        case 2:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total3",for:indexPath)
            cellSet(ix: 2, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total3",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
        case 3:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total4",for:indexPath)
            cellSet(ix: 3, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total4",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
        case 4:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total5",for:indexPath)
            cellSet(ix: 4, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total5",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
        case 5:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total6",for:indexPath)
            cellSet(ix: 5, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total6",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
        case 6:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total7",for:indexPath)
            cellSet(ix: 6, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total7",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
        case 7:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total8",for:indexPath)
            cellSet(ix: 7, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total8",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
        case 8:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total9",for:indexPath)
            cellSet(ix: 8, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total9",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
        case 9:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total10",for:indexPath)
            cellSet(ix: 9, cell: cell, Buytotal: Buytotal)
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total10",for:indexPath)
            cellSetInit(cell: cell)
            return cell
        }
            
        default:
        if indexPath.row < buyArray.count{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total11",for:indexPath)
        cellSet(ix: 1, cell: cell, Buytotal: Buytotal)
        return cell
        }else{
        let cell = table.dequeueReusableCell(withIdentifier: "zairyo_total11",for:indexPath)
        cellSetInit(cell: cell)
        return cell
     }
    }
  }
}
