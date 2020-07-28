//
//  ViewController.swift
//  menu_make
//
//  Created by 松土記士 on 2020/04/28.
//  Copyright © 2020 松土記士. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController,UITableViewDataSource,UITextFieldDelegate {
    var Youbi = ""
    var getMenuPlate:String = ""
    
    let realm = try! Realm()


    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        let menuModel = realm.objects(MenuModel.self)
        if menuModel.isEmpty == true{
           let newCategory = MenuModel()
           save(menuall:newCategory)
           print(MenuModel())
        }
        Menutable.dataSource = self
        Menutable.reloadData()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func Getyoubi(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            self.Youbi = Youbiget.set(at: 0)!
//        case 1:
//            self.Youbi = Youbiget.titleForSegment(at: 1)!
//        case 2:
//            self.Youbi = Youbiget.titleForSegment(at: 2)!
//        case 3:
//            self.Youbi = Youbiget.titleForSegment(at: 3)!
//        case 4:
//            self.Youbi = Youbiget.titleForSegment(at: 4)!
//        case 5:
//            self.Youbi = Youbiget.titleForSegment(at: 5)!
//        default:
//            self.Youbi = Youbiget.titleForSegment(at: 6)!
//        }
//        print(Youbi)
//    }
    
    @IBOutlet weak var firstDatetitle: UIButton!
    @IBOutlet weak var secondDatetitle: UIButton!
    @IBOutlet weak var thirdDatetitle: UIButton!
    @IBOutlet weak var fourthDatetitle: UIButton!
    @IBOutlet weak var fifthDatetitle: UIButton!
    @IBOutlet weak var sixthDatetitle: UIButton!
    @IBOutlet weak var seventhDatetitle: UIButton!
    
    @IBOutlet weak var Menutable: UITableView!
    @IBAction func exit(segue:UIStoryboardSegue){
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        switch segue.identifier{
          case "firstDate":
            let nav = segue.destination as! UINavigationController
            let second = nav.topViewController as! SecondViewController
            second.Youbitext = self.firstDatetitle.currentTitle!
            print(second.Youbitext)
          case "secondDate":
            let nav = segue.destination as! UINavigationController
            let second = nav.topViewController as! SecondViewController
            second.Youbitext = self.secondDatetitle.currentTitle!
            print(second.Youbitext)
          case "thirdDate":
            let nav = segue.destination as! UINavigationController
            let second = nav.topViewController as! SecondViewController
            second.Youbitext = self.thirdDatetitle.currentTitle!
            print(second.Youbitext)
          case "fourthDate":
            let nav = segue.destination as! UINavigationController
            let second = nav.topViewController as! SecondViewController
            second.Youbitext = self.fourthDatetitle.currentTitle!
            print(second.Youbitext)
          case "fifthDate":
            let nav = segue.destination as! UINavigationController
            let second = nav.topViewController as! SecondViewController
            second.Youbitext = self.fifthDatetitle.currentTitle!
            print(second.Youbitext)
          case "sixthDate":
            let nav = segue.destination as! UINavigationController
            let second = nav.topViewController as! SecondViewController
            second.Youbitext = self.sixthDatetitle.currentTitle!
            print(second.Youbitext)
          case "seventhDate":
            let nav = segue.destination as! UINavigationController
            let second = nav.topViewController as! SecondViewController
            second.Youbitext = self.seventhDatetitle.currentTitle!
            print(second.Youbitext)
        default:
//            let nav = segue.destination as! UINavigationController
//            let total = nav.viewControllers as! totalViewController
            print("total")
            
        }
     
    }
    //***************************************************************
    //  初めてappを開く時に、自動でRealm Sozaimodelから素材名（sozainame）を取得し配列データを返す。
    //***************************************************************
    func save(menuall: MenuModel) {
            let Sozai1 = Sozai(value: ["sozainame":"にんじん",
                   "kosu":"2",
                   "tani":"個",
                   "bunrui":"野菜・果物",
                   "kasan": true])
            let Sozai2 = Sozai(value: ["sozainame":"にんにく",
                   "kosu":"1",
                   "tani":"かけ",
                   "bunrui":"野菜・果物",
                   "kasan": true])
           
            let dic1 = MenuModel(value: ["menuname": "カレー","materials":[Sozai1,Sozai2]])
           do {
               try realm.write {
                   realm.add(dic1)
               }
           } catch {
               print("Error saving menues \(error)")
           }
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          print("aaa:\(#function)")
              return 7
    }
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("1\(#function)")
       

        switch indexPath.row {
        case 0:
            let cell = table.dequeueReusableCell(withIdentifier: "menu1",for:indexPath)
            let label1 = cell.viewWithTag(1) as! UILabel
            label1.text = self.firstDatetitle.currentTitle!
            let Menufil = realm.objects(WeekMenu.self)
            let menu_week = Menufil.filter("weekday = '\(self.firstDatetitle.currentTitle!)'")
            if menu_week.isEmpty != true{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = menu_week[0].menuname
            }else{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = ""
            }
                        
            return cell
        case 1:
            let cell = table.dequeueReusableCell(withIdentifier: "menu2",for:indexPath)
            let label1 = cell.viewWithTag(1) as! UILabel
            label1.text = self.secondDatetitle.currentTitle!
            let Menufil = realm.objects(WeekMenu.self)
            print("\(Menufil)?回目")
            let menu_week = Menufil.filter("weekday = '\(self.secondDatetitle.currentTitle!)'")
            if menu_week.isEmpty != true{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = menu_week[0].menuname
            }else{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = ""
            }
            
            return cell
        case 2:
            let cell = table.dequeueReusableCell(withIdentifier: "menu3",for:indexPath)
            let label1 = cell.viewWithTag(1) as! UILabel
            label1.text = self.thirdDatetitle.currentTitle!
            let Menufil = realm.objects(WeekMenu.self)
            let menu_week = Menufil.filter("weekday = '\(self.thirdDatetitle.currentTitle!)'")
            if menu_week.isEmpty != true{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = menu_week[0].menuname
            }else{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = ""
            }
            
            return cell
        case 3:
            let cell = table.dequeueReusableCell(withIdentifier: "menu4",for:indexPath)
            let label1 = cell.viewWithTag(1) as! UILabel
            label1.text = self.fourthDatetitle.currentTitle!
            let Menufil = realm.objects(WeekMenu.self)
            let menu_week = Menufil.filter("weekday = '\(self.fourthDatetitle.currentTitle!)'")
            if menu_week.isEmpty != true{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = menu_week[0].menuname
            }else{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = ""
            }
                        
            return cell
        case 4:
            let cell = table.dequeueReusableCell(withIdentifier: "menu5",for:indexPath)
            let label1 = cell.viewWithTag(1) as! UILabel
            label1.text = self.fifthDatetitle.currentTitle!
            let Menufil = realm.objects(WeekMenu.self)
            let menu_week = Menufil.filter("weekday = '\(self.fifthDatetitle.currentTitle!)'")
            if menu_week.isEmpty != true{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = menu_week[0].menuname
            }else{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = ""
            }
                        
            return cell
        case 5:
            let cell = table.dequeueReusableCell(withIdentifier: "menu6",for:indexPath)
            let label1 = cell.viewWithTag(1) as! UILabel
            label1.text = self.sixthDatetitle.currentTitle!
            let Menufil = realm.objects(WeekMenu.self)
            let menu_week = Menufil.filter("weekday = '\(self.sixthDatetitle.currentTitle!)'")
            if menu_week.isEmpty != true{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = menu_week[0].menuname
            }else{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = ""
            }
                        
            return cell
        default:
            let cell = table.dequeueReusableCell(withIdentifier: "menu7",for:indexPath)
            let label1 = cell.viewWithTag(1) as! UILabel
            label1.text = self.seventhDatetitle.currentTitle!
            let Menufil = realm.objects(WeekMenu.self)
            let menu_week = Menufil.filter("weekday = '\(self.seventhDatetitle.currentTitle!)'")
            if menu_week.isEmpty != true{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = menu_week[0].menuname
            }else{
                let label2 = cell.viewWithTag(2) as! UILabel
                label2.text = ""
            }
            
            return cell
            
        }
    
    }
//    func setCellinit(cell:UITableViewCell){
//        let label1 = cell.viewWithTag(1) as! UILabel
//        label1.text = ""
//        let label2 = cell.viewWithTag(2) as! UILabel
//        label2.text = ""
//        let label3 = cell.viewWithTag(3) as! UILabel
//        label3.text = ""
//    }

}
