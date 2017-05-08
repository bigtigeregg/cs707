//
//  WebViewController.swift
//  cs707p1
//
//  Created by wuyue on 12/1/16.
//  Copyright © 2016 cs707. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myWebView.loadRequest(URLRequest(url: URL(string: "http://128.105.22.51:5000/app-dist/#/photos")!))
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
