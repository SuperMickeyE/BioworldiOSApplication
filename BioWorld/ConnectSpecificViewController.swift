//
//  ViewController.swift
//  BioWorld
//
//  Created by McKenna on 2/10/17.
//  Copyright © 2017 UTA Bioworld Team. All rights reserved.
//

import UIKit
import BluetoothKit

class ConnectSpecificViewController: UIViewController {
    
    //let peripheral = BKPeripheral()

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var BioWorldButton: UIButton!
    
    @IBAction func BioWorldPressed(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup bluetooth
        /*self.peripheral.delegate = self
        do {
            let serviceUUID = UUID(uuidString: "6E6B5C64-FAF7-40AE-9C21-D4933AF45B23")!
            let characteristicUUID = UUID(uuidString: "477A2967-1FAB-4DC5-920A-DEE5DE685A3D")!
            let localName = "My Cool Peripheral"
            let configuration = BKPeripheralConfiguration(dataServiceUUID: serviceUUID, dataServiceCharacteristicUUID:  characteristicUUID, localName: localName)
            try peripheral.startWithConfiguration(configuration)
            // You are now ready for incoming connections
        } catch let error {
            // Handle error.
            print("ERROORRR")
            print(error)
        }*/
    }
    
    // Update ui based off bluetooth state
    /*func refreshControls() {
        let 😜 = peripheral.connectedRemoteCentrals.count > 0
        
        if 😜 {
            mainLabel.text = "You are connected! congrats 🚀"
            connectButton.titleLabel?.text = "Disconnect"
        } else {
            mainLabel.text = "Not connected 😭"
            connectButton.titleLabel?.text = "Connect"
        }
    }
    
    // MARK: BKPeripheralDelegate
    func peripheral(_ peripheral: BKPeripheral, remoteCentralDidConnect remoteCentral: BKRemoteCentral) {
        print("You are connected!")
        remoteCentral.delegate = self
        refreshControls()
    }
    
    func peripheral(_ peripheral: BKPeripheral, remoteCentralDidDisconnect remoteCentral: BKRemoteCentral) {
        print("Disconnected!!")
        refreshControls()
    }
    
    // MARK: BKRemotePeerDelegate
    func remotePeer(_ remotePeer: BKRemotePeer, didSendArbitraryData data: Data) {
        print("Received data of length: \(data.count) with hash: \(data)")
    }*/

}

