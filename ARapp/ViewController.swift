//
//  ViewController.swift
//  ARapp
//
//  Created by Bill on 8/28/17.
//  Copyright © 2017 Bill Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sensorCtrl : SensorViewController!
    var mapCtrl : MapViewController!
    var currentView : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.white
        
        let button1 = UIButton(frame: CGRect(x: 20.0, y: 42.0, width: 128.0, height: 48.0))
        button1.backgroundColor = UIColor.gray
        button1.setTitle("Sensors", for: .normal)
        button1.addTarget(self, action: #selector(ViewController.sensorButton), for: UIControlEvents.touchUpInside)
        
        let button2 = UIButton(frame: CGRect(x: 20.0, y: 100.0, width: 128.0, height: 48.0))
        button2.backgroundColor = UIColor.gray
        button2.setTitle("Map", for: .normal)
        button2.addTarget(self, action: #selector(ViewController.mapButton), for: UIControlEvents.touchUpInside)
        
        self.sensorCtrl = SensorViewController()
        self.mapCtrl = MapViewController()
        //self.view.addSubview(mapCtrl.view)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
    }
    
    func sensorButton() {
        if(currentView != 1) {
            for v in self.view.subviews {
                v.removeFromSuperview();
            }
        }
        
        self.view.addSubview(self.sensorCtrl.view)
    }
    
    func mapButton() {
        if(currentView != 2) {
            for v in self.view.subviews {
                v.removeFromSuperview();
            }
        }
        
        self.view.addSubview(self.mapCtrl.view)
    }
}
