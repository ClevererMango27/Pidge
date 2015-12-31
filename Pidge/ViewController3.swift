//
//  ViewController3.swift
//  Pidge
//
//  Created by Brendon Ho on 12/30/15.
//  Copyright © 2015 Pidge. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController3: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var captureTime : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?

    @IBOutlet weak var cameraView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureTime = AVCaptureSession()
        captureTime?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        var backCam = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        var error : NSError?
        var input = AVCaptureDeviceInput(device: backCam, error: &error)
        
        if error == nil && captureTime?.canAddInput(input){
            captureTime?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if ((captureTime?.canAddOutput(stillImageOutput)) != nil){
                captureTime?.addOutput(stillImageOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureTime)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureTime?.startRunning()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
