//
//  streamwebViewController.swift
//  cs707p1
//
//  Created by wuyue on 12/1/16.
//  Copyright © 2016 cs707. All rights reserved.
//

import UIKit
import Alamofire

class streamwebViewController: UIViewController {

    @IBOutlet weak var photobutton: UIButton!
        @IBAction func takePhotoButton(_ sender: Any) {
        Alamofire.request("http://halo37.wings.cs.wisc.edu:8011/snap", method: .get).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data )     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
    @IBOutlet weak var streamWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photobutton.layer.cornerRadius = 5
        photobutton.layer.borderWidth = 1
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        streamWebView.loadRequest(URLRequest(url: URL(string: "http://halo37.wings.cs.wisc.edu:81/video.cgi")!))
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

}
