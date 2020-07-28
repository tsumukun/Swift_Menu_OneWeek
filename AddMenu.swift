//
//  AddMenu.swift
//  menu_make
//
//  Created by 松土記士 on 2020/06/07.
//  Copyright © 2020 松土記士. All rights reserved.
//

import UIKit
import RealmSwift

class AddMenu: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDataSource,UITextFieldDelegate{
    let realm = try! Realm()

    @IBOutlet weak var MenuAdd: UITextField!
    @IBOutlet weak var ZairyoAdd: UITextField!
    @IBOutlet weak var SuryoAdd: UITextField!
    @IBOutlet weak var Taniselect: UITextField!
    @IBOutlet weak var BunruiSelect: UITextField!
    @IBOutlet weak var SozaiTable: UITableView!
    @IBOutlet weak var TyoumiryouSW: UISwitch!
    
    var menuchoice:UIPickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()

        menuchoice.delegate = self
        menuchoice.dataSource = self
        menuchoice.selectedRow(inComponent:0)
        SozaiTable.dataSource = self
                
                
        //
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddMenu.done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(AddMenu.cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)
        MenuAdd.delegate = self
        ZairyoAdd.delegate = self
        SuryoAdd.delegate = self
        Taniselect.delegate = self
        BunruiSelect.delegate = self
        self.Taniselect.inputView = menuchoice
        self.Taniselect.inputAccessoryView = toolbar
        self.BunruiSelect.inputView = menuchoice
        self.BunruiSelect.inputAccessoryView = toolbar

        print("1\(#function)")
          
        }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        MenuAdd.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var dataList: [String] = []
    let bunruiArray:Array<String> = ["","野菜・果物","肉・魚","加工品","米","乳製品","卵","水","調味料"]
    
    let taniArray:Array<String> = ["","個","グラム","本","枚","パック","杯","cup","缶","かけ","ml","大さじ","小さじ"]
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 0:
            // タグが0ならsecondTextFieldにフォーカスを当てる
            ZairyoAdd.becomeFirstResponder()
            break
        case 1:
            // タグが1ならsecondTextFieldにフォーカスを当てる
            SuryoAdd.becomeFirstResponder()
            break
        case 2:
            // タグが2ならキーボードを閉じる
            Taniselect.resignFirstResponder()
            break
        default:
            break
        }
        return true
    }
    var tagChoice = 0
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3:
            //
            dataList = taniArray
            menuchoice.reloadAllComponents()
            tagChoice = 3
            break
        case 4:
            //
            dataList = bunruiArray
            menuchoice.reloadAllComponents()
            tagChoice = 4
            break
        default:
            break
        }
        return true
    }
    
    
    //***************************************************************
    //***************************************************************
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        pickerのスクロール画面の個数を設定
            return 1
        }
    //***************************************************************
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        picker内のリスト数を制御
            return dataList.count
        }
    //***************************************************************
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        picekerのリストの文字をセット
            return dataList[row]
        }
    //***************************************************************
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            //textFieldごとに制御
            if tagChoice == 3 {
                self.Taniselect.text = self.dataList[row]
            }else{
            //textFieldごとに制御
            if tagChoice == 4 {
                self.BunruiSelect.text = self.dataList[row]
                
                }
            }
        }
    //***************************************************************
        @objc func cancel() {
            self.Taniselect.text = ""
            self.Taniselect.endEditing(true)
            self.BunruiSelect.text = ""
            self.BunruiSelect.endEditing(true)
        }
            
    //***************************************************************
        @objc func done() {
            self.Taniselect.endEditing(true)
            self.BunruiSelect.endEditing(true)
        }
    //***************************************************************
        func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
            return CGRect(x: x, y: y, width: width, height: height)
        }
    //***************************************************************
    //***************************************************************
    var sozaiStock:[Any] = []
    var sozaiStockAll:[Array<Any>]=[]
    
    @IBAction func SozaidetailAdd(_ sender: UIButton) {
        if ZairyoAdd.hasText == true , SuryoAdd.hasText == true ,Taniselect.hasText == true,
        BunruiSelect.hasText == true{
            sozaiStock.removeAll()
            self.sozaiStock.append(ZairyoAdd.text!)
            self.sozaiStock.append(SuryoAdd.text!)
            self.sozaiStock.append(Taniselect.text!)
            self.sozaiStock.append(BunruiSelect.text!)
            if TyoumiryouSW.isOn == true{
               self.sozaiStock.append(false)
            }else{
               self.sozaiStock.append(true)
            }
            self.sozaiStockAll.append(sozaiStock)
            print(sozaiStock)
            print("all\(sozaiStockAll)")
            SozaiTable.reloadData()
            ZairyoAdd.text = ""
            SuryoAdd.text = ""
            Taniselect.text = ""
            BunruiSelect.text = ""
            
        }else{
            let title = "入力エラー"
            let message = "入力項目が不足してます。"
            let okText = "ok"

            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okayButton)

            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func MenuAddButton(_ sender: UIButton) {
        let dic1 = MenuModel(value: ["menuname": MenuAdd.text!])
        do {
           try realm.write {
               realm.add(dic1)
           }
       } catch {
           print("Error saving menues \(error)")
       }
       for index in 0..<sozaiStockAll.count{
           let Zairyoues = Sozai(value:
               ["sozainame":sozaiStockAll[index][0],
           "kosu":sozaiStockAll[index][1],
           "tani":sozaiStockAll[index][2],
           "bunrui":sozaiStockAll[index][3],
           "kasan":sozaiStockAll[index][4]])
           do {
              let realm = try Realm()
              try realm.write {
               dic1.materials.append(Zairyoues)
              }
          } catch {
              print("Error saving menues \(error)")
          }
       
    }
        self.sozaiStock = []
        self.sozaiStockAll = []
        MenuAdd.text = ""
        let title = "完了"
        let message = "メニューが追加されました。"
        let okText = "ok"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        present(alert, animated: true, completion: nil)
        SozaiTable.reloadData()

    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             print("aaa:\(#function)")
                 return 10
       }
    func cellSet(cell:UITableViewCell,ix:Int){
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = sozaiStockAll[ix][0] as! String
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = sozaiStockAll[ix][1] as! String
        let label3 = cell.viewWithTag(3) as! UILabel
        label3.text = sozaiStockAll[ix][2] as! String
        let label4 = cell.viewWithTag(4) as! UILabel
        label4.text = sozaiStockAll[ix][3] as! String
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
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("1\(#function)")
        
        switch indexPath.row{
        case 0:
            let cell = table.dequeueReusableCell(withIdentifier: "addzairyo1",for:indexPath)
            if sozaiStockAll.count > indexPath.row{
                cellSet(cell:cell,ix:0)
                return cell
            }else{
                cellSetInit(cell: cell)
                return cell
            }
        case 1:
            let cell = table.dequeueReusableCell(withIdentifier: "addzairyo2",for:indexPath)
            if sozaiStockAll.count > indexPath.row{
                cellSet(cell:cell,ix:1)
                return cell
            }else{
                cellSetInit(cell: cell)
                return cell
            }
        case 2:
            let cell = table.dequeueReusableCell(withIdentifier: "addzairyo3",for:indexPath)
            if sozaiStockAll.count > indexPath.row{
                cellSet(cell:cell,ix:2)
                return cell
            }else{
                cellSetInit(cell: cell)
                return cell
            }
        case 3:
            let cell = table.dequeueReusableCell(withIdentifier: "addzairyo4",for:indexPath)
            if sozaiStockAll.count > indexPath.row{
                cellSet(cell:cell,ix:3)
                return cell
            }else{
                cellSetInit(cell: cell)
                return cell
            }
        default:
            let cell = table.dequeueReusableCell(withIdentifier: "addzairyo5",for:indexPath)
            if sozaiStockAll.count > indexPath.row{
                cellSet(cell:cell,ix:4)
                return cell
            }else{
                cellSetInit(cell: cell)
                return cell
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
