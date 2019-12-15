//
//  NextViewController.swift
//  fireBasePods
//
//  Created by Felix-ITS016 on 15/11/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class NextViewController: UIViewController,UITableViewDataSource {
var nameArray = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    @IBOutlet weak var TableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
        }
    
    override func viewDidLoad() {
         TableView.dataSource = self
        super.viewDidLoad()
        var reference:DatabaseReference
        reference = Database.database().reference()
        reference.observeSingleEvent(of: .value, with: {(snapshot)in
            let dic = snapshot.value as! [String:Any]
            let courseDic = dic["courses"]as! [String:Any]
            for item in courseDic.keys
            {
                let finalDic = courseDic[item] as!
                [String:Any]
                let courseName = finalDic["Name"] as! String
                print(courseName)
                self.nameArray.append(courseName)
            }
            self.TableView.reloadData()
        })
        print(self.nameArray)
        // Do any additional setup after loading the view.
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
