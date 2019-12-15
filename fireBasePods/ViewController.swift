//
//  ViewController.swift
//  fireBasePods
//
//  Created by Felix-ITS016 on 14/11/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseCore
//import GoogleUtilities
import FirebaseDatabase
class ViewController: UIViewController  {
   
    
    var ref: DatabaseReference!
    var courseDic = NSMutableDictionary()
   
    @IBOutlet weak var courseName: UITextField!
    
    @IBOutlet weak var courseFee: UITextField!
    
    @IBOutlet weak var courseDuration: UITextField!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func ReadButton(_ sender: UIButton) {
        let next = storyboard?.instantiateViewController(withIdentifier: "NextViewController")as!NextViewController
        self.navigationController?.pushViewController(next, animated: true)
    }
    

    @IBAction func saveButton(_ sender: Any) {
       ref = Database.database().reference()
        courseDic.setValue(courseName.text!, forKey: "Name")
        courseDic.setValue(courseDuration.text!, forKey: "Duration")
        courseDic.setValue(courseFee.text!, forKey: "Fee")
        
        
        ref.child("courses").childByAutoId().setValue(courseDic){  (error , reference)
            in
            
            if (error != nil)
            {
                print("Failed to Insert:\(error!.localizedDescription)")
            }
            else
            {
                print("Insert:Success")
            }
        }
    }
}

