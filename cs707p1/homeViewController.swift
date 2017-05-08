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
        slider.isContinuous = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setButtonColor (_ color: UIColor) {
        button.setTitleColor(color, for:UIControlState())
        let component = color.cgColor
        let ncomponent = component.components
        let r = (ncomponent?[0])! * 255
        let g = (ncomponent?[1])! * 255
        let b = (ncomponent?[2])! * 255
        let parameters: Parameters = [
            "feature": "color",
            "r": r,
            "g": g,
            "b": b
        ]
         Alamofire.request("http://128.105.22.51:8012/json", method: .post, parameters: parameters, encoding: URLEncoding.default)
    }
    

    @IBAction func editchange(_ sender: Any) {
        
        let value = Int(slider.value * 100)
        print(value)
        let parameters: Parameters = [
            "feature": "brightness",
            "value": value
        ]
        Alamofire.request("http://128.105.22.51:8012/json", method: .post, parameters: parameters, encoding: URLEncoding.default)
    }


    @IBAction func lightEnabler(_ sender: Any) {
        if(lightSwitch.isOn){
            print("Turn On Light")
            
            let parameters: Parameters = [
                "feature": "power",
                "value": 1
            ]
            
            Alamofire.request("http://128.105.22.51:8012/json", method: .post, parameters: parameters, encoding: URLEncoding.default)
        }
        else{
            print("Turn Off Light")
            
            let parameters: Parameters = [
                "feature": "power",
                "value": 0
            ]
            Alamofire.request("http://128.105.22.51:8012/json", method: .post, parameters: parameters, encoding: URLEncoding.default)
            
        }
    }
}
