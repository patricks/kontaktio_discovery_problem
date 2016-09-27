//
//  ViewController.swift
//  testApp1
//
//  Created by Patrick Steiner on 27.09.16.
//  Copyright © 2016 Mopius. All rights reserved.
//

import UIKit
import KontaktSDK

class ViewController: UIViewController {
    
    private var deviceManager: KTKDevicesManager?
    //private var deviceManager: KTKDevicesManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        deviceManager = KTKDevicesManager(delegate: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print(#function)
        startDiscovery()
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print(#function)
        stopDiscovery()
    }
    
    private func startDiscovery() {
        /*
        if deviceManager.discovering {
            print("Already discovering...")
            return
        }
        
        deviceManager.startDevicesDiscoveryWithInterval(2)
        */
        
        if let manager = deviceManager {
            if manager.discovering {
                print("Already discovering...")
                return
            }
        }
         
         deviceManager?.startDevicesDiscoveryWithInterval(2)
    }
    
    private func stopDiscovery() {
        //deviceManager.stopDevicesDiscovery()
        deviceManager?.stopDevicesDiscovery()
    }
}

extension ViewController: KTKDevicesManagerDelegate {
    func devicesManager(manager: KTKDevicesManager, didDiscoverDevices devices: [KTKNearbyDevice]?) {
        print("DISCOVERED devices \(NSDate())")
    }
}

