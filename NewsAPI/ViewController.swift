//
//  ViewController.swift
//  NewsAPI
//
//  Created by tatsumi kentaro on 2018/08/02.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var date:String!
    var json:JSON!
    var contentsArray = [Contents]()
    var num:Int!
    @IBOutlet weak var mainTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(date)
        mainTable.dataSource = self
        mainTable.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = contentsArray[indexPath.row].name
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        num = indexPath.row
        print(num)
        performSegue(withIdentifier: "GoWeb", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoWeb"{
            let webviewcontroller = segue.destination as! WebViewController
            webviewcontroller.content = self.contentsArray[num]
        }
    }
    
    
}

