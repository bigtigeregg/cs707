//
//  streamwebViewController.swift
//  cs707p1
//
//  Created by wuyue on 12/1/16.
//  Copyright © 2016 cs707. All rights reserved.
//

import UIKit

class streamwebViewController: UIViewController {

    @IBOutlet weak var streamWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        streamWebView.loadRequest(URLRequest(url: URL(string: "http://halo37.wings.cs.wisc.edu:5000/app-dist/#/live-stream")!))
        
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
