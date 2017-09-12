//
//  SensorViewController.swift
//  ARapp
//
//  Created by Bill on 9/7/17.
//  Copyright © 2017 Bill Pham. All rights reserved.
//

import AVFoundation
import CoreMotion
import Foundation
import UIKit

class SensorViewController: UIViewController {
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            
            self.view.layer.addSublayer(videoPreviewLayer!)
            captureSession?.startRunning()
            
            let txtview = UITextView(frame: CGRect(x: UIScreen.main.bounds.width * 0.05, y: UIScreen.main.bounds.height * 0.85, width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.15))
            txtview.text = "Device motion info here"
            self.view.addSubview(txtview)
            
            motionManager = CMMotionManager()
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {
                deviceMotion, error in
                let gravX:Double = (deviceMotion?.gravity.x)!
                let gravY:Double = (deviceMotion?.gravity.y)!
                let gravZ:Double = (deviceMotion?.gravity.z)!
                let rotaX:Double = (deviceMotion?.rotationRate.x)!
                let rotaY:Double = (deviceMotion?.rotationRate.y)!
                let rotaZ:Double = (deviceMotion?.rotationRate.z)!
                var orientation:String = "querying"
                if(gravZ < -0.75) {
                    orientation = "Facing Up"
                }
                else if(gravX < -0.75 || gravX > 0.75) {
                    orientation = "Sideways"
                }
                else if(gravY < -0.75) {
                    orientation = "Upright"
                }
                
                txtview.text = "gravX:" + gravX.description + "\ngravY:" + gravY.description + "\ngravZ:" + gravZ.description + "\nrotaX:" + rotaX.description + "\nrotaY:" + rotaY.description + "\nrotaZ:" + rotaZ.description + "\nOrientation: " + orientation + "\n"
            })
        } catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        // Do something
        self.view = UIView(frame: UIScreen.main.bounds)
    }
}
