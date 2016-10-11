//
//  ViewController.swift
//  MeshHack
//
//  Created by Takashi Hatakeyama on 2016/10/11.
//  Copyright © 2016年 esm. All rights reserved.
//

import Cocoa
import CoreBluetooth

class ViewController: NSViewController, CBCentralManagerDelegate {
    var centralManager: CBCentralManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    // MARK: - CBCentralManagerDelegate

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            print("state: poweredOff")
        case .poweredOn:
            print("state: poweredOn")
        case .resetting:
            print("state: resetting")
        case .unauthorized:
            print("state: unauthorized")
        case .unknown:
            print("state: unauthorized")
        case .unsupported:
            print("state: unsupported")
        }
    }
}

