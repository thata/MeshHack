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
    var peripheral: CBPeripheral?

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

            // LEDタグ（ serviceのUUID = 72C90001-57A9-4D40-B746-534E22EC9F9E ）のスキャンを開始
            let service = CBUUID(string: "72C90001-57A9-4D40-B746-534E22EC9F9E")
            self.centralManager?.scanForPeripherals(withServices: [service], options: nil)

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

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {

        print("発見したBLEデバイス: \(peripheral)")

        // ペリフェラルがメモリから開放されないよう、インスタンス変数へ保持しておく
        self.peripheral = peripheral

        // 接続開始
        self.centralManager?.connect(peripheral, options: nil)
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // 接続成功

        print("接続成功: \(peripheral)")

    }
}

