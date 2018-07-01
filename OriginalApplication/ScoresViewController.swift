//
//  ScoresViewController.swift
//  OriginalApplication
//
//  Created by 今泉櫻子 on 2018/01/13.
//  Copyright © 2018年 今泉櫻子. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var buttons: UIButton!
    var saveData: UserDefaults = UserDefaults.standard
    var ScoreArray: [Int] = []
    var text: String!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        print("\(text)scores")
        table.delegate = self
        table.dataSource = self
        ScoreArray = saveData.object(forKey: "\(text)scores") as! [Int]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.table.reloadData()
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var testTableView: UITableView!
    
    @IBAction func button(_ sender: AnyObject) {
        //通常モードと編集モードを切り替える。
        if(testTableView.isEditing == true) {
            testTableView.isEditing = false
            buttons.setTitle("編集", for: .normal)
        } else {
            testTableView.isEditing = true
            buttons.setTitle("完了", for: .normal)
        }
    }
    
    //テーブルビュー編集時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //削除の場合、配列からデータを削除する。
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            ScoreArray.remove(at: indexPath.row)
             saveData.set(ScoreArray, forKey: "\(text)scores")
        }
        //テーブルの再読み込み
        tableView.reloadData()
    }
    
    
    //並び替え時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        
        //移動されたデータを取得する。
        let moveData = tableView.cellForRow(at: sourceIndexPath as IndexPath)?.textLabel!.text
        
        //元の位置のデータを配列から削除する。
        ScoreArray.remove(at: sourceIndexPath.row)
        
        //移動先の位置にデータを配列に挿入する。
        ScoreArray.insert(Int(moveData!)!, at: destinationIndexPath.row)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ScoreArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = String(ScoreArray[indexPath.row])
        return cell!
    }
 
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
