//
//  StartViewController.swift
//  NewsAPI
//
//  Created by tatsumi kentaro on 2018/08/02.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StartViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    var date:String!
    var json:JSON!
    var contentsArray = [Contents]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func decide(_ sender: UIButton) {
        guard dateTextField.text != nil else {
            print("何もない")
            return
        }
        date = dateTextField.text
        Alamofire.request("https://intense-wave-30042.herokuapp.com/news", method: .get, parameters: ["date":date!], encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            guard let objectStr = response.result.value else { return }
            let object = (objectStr as AnyObject).data(using: String.Encoding.utf8.rawValue)
            self.json = JSON(object as Any)
            print(self.json)
            print(type(of: self.json))
            self.contentsArray = [Contents]()
            for i in 0..<self.json.count{
             print(self.json[i]["url"])
                self.contentsArray.append(Contents(url: self.json[i]["url"].url!, name: self.json[i]["name"].string!, date: self.json[i]["date"].string!))
            }
            self.performSegue(withIdentifier: "NewsResult", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsResult"{
            let viewcontroller = segue.destination as! ViewController
            viewcontroller.contentsArray = self.contentsArray
        }
    }
}
