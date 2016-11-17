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
        guard let manager = deviceManager else {
            print("Device manager is nil")
            return
        }

        if manager.discovering {
            print("Already discovering...")
            return
        }
        
        print("Start discovering...")
        manager.startDevicesDiscoveryWithInterval(2)
    }
    
    private func stopDiscovery() {
        guard let manager = deviceManager else {
            print("Device manager is nil")
            return
        }
        
        print("Stop discovering...")
        manager.stopDevicesDiscovery()
    }
}

extension ViewController: KTKDevicesManagerDelegate {
    func devicesManager(manager: KTKDevicesManager, didDiscoverDevices devices: [KTKNearbyDevice]?) {
        print("DISCOVERED devices \(NSDate())")
    }
}

