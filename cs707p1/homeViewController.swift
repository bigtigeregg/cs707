//
//  homeViewController.swift
//  cs707p1
//
//  Created by wuyue on 12/12/16.
//  Copyright © 2016 cs707. All rights reserved.
//

import UIKit
import Alamofire

class homeViewController: UIViewController,  UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lightSwitch: UISwitch!
    
    @IBOutlet var button: UIButton!
    
    // Generate popover on button press
    @IBAction func colorPickerButton(_ sender: UIButton) {
        
        let popoverVC = storyboard?.instantiateViewController(withIdentifier: "colorPickerPopover") as! ColorPickerViewController
        popoverVC.modalPresentationStyle = .popover
        popoverVC.preferredContentSize = CGSize(width: 284, height: 446)
        if let popoverController = popoverVC.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = CGRect(x: 0, y: 0, width: 85, height: 30)
            popoverController.permittedArrowDirections = .any
            popoverController.delegate = self
            popoverVC.delegate = self
        }
        present(popoverVC, animated: true, completion: nil)
    }
    
    // Override the iPhone behavior that presents a popover as fullscreen
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButtonColor (_ color: UIColor) {
        button.setTitleColor(color, for:UIControlState())
    }
    
    @IBAction func brightnessSlider(_ sender: Any) {
        print(slider.value)
    }

    @IBAction func lightEnabler(_ sender: Any) {
        if(lightSwitch.isOn){
            print("Turn On Light")
            Alamofire.request("http://halo37.wings.cs.wisc.edu:8012/led/on", method: .get).responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // HTTP URL response
                print(response.data )     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
            }
        }
        else{
            print("Turn Off Light")
            Alamofire.request("http://halo37.wings.cs.wisc.edu:8012/led/off", method: .get).responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // HTTP URL response
                print(response.data )     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
            }
        }
    }
    
}
