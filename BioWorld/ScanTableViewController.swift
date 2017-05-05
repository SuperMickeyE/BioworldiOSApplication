//
//  ScanTableViewController.swift
//  BioWorld
//
//  Created by McKenna on 2/10/17.
//  Copyright © 2017 UTA Bioworld Team. All rights reserved.
//

import UIKit
import BluetoothKit
// This is the class that performs all connection
class ScanTableViewController: UITableViewController, BKCentralDelegate {
    
    var data = [BKDiscovery]()
    
    let central = BKCentral()
    var scanning = false
    
    @IBOutlet weak var scanButton: UIBarButtonItem!
    
    @IBOutlet var ScanTableView: UITableView!
    
    @IBAction func scanPressed(_ sender: UIBarButtonItem) {
        if scanning {
            stopScanning()
        } else {
            startScanning()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        central.delegate = self
        //central.addAvailabilityObserver(self as! BKAvailabilityObserver)
        do {
            let serviceUUID = UUID(uuidString: "0000F00D-1212-EFDE-1523-785FEF13D123")!
            let characteristicUUID = UUID(uuidString: "0000BEEF-1212-EFDE-1523-785FEF13D123")!
            //let calcharacteristicUUID = UUID(uuidString: "00009999-1212-EFDE-1523-785FEF13D123")!
            let configuration = BKConfiguration(dataServiceUUID: serviceUUID, dataServiceCharacteristicUUID: characteristicUUID)
            try central.startWithConfiguration(configuration)
            // Once the availability observer has been positively notified, you're ready to discover and connect to peripherals.
        } catch let error {
            print("error: \(error)")
        }
    }
    
    func reloadUI() {
        scanButton.title = scanning ? "Stop" : "Scan"
    }
    
    func startScanning() {
        scanning = true
        reloadUI()
        
        central.scanContinuouslyWithChangeHandler({ changes, discoveries in
            // Handle changes to "availabile" discoveries, [BKDiscoveriesChange].
            // Handle current "available" discoveries, [BKDiscovery].
            // This is where you'd ie. update a table view.
            print("Scanning")
            print("Changes: \(changes)")
            print("Discoveries: \(discoveries)")
            
            self.data = discoveries
            self.tableView.reloadData()
            
        }, stateHandler: { newState in
            print("New state!")
            print(newState)
            // Handle newState, BKCentral.ContinuousScanState.
            // This is where you'd ie. start/stop an activity indicator.
        }, duration: 3, inBetweenDelay: 3, errorHandler: { error in
            print("ERROR")
            print(error)
        })
    }
    
    func stopScanning() {
        scanning = false
        reloadUI()
        
        // DO NOT ACTUALLY DO THIS
        central.interruptScan()
        try! central.stop()
    }

    // Mack: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = data[indexPath.row].localName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let alert = UIAlertController(title: "Item found!", message: "Item: abc123", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        self.show(alert, sender: self)
    }
    
    // Mack: - Bluetooth
    
    /**
     Called when a remote peripheral disconnects or is disconnected.
     - parameter central: The central from which it disconnected.
     - parameter remotePeripheral: The remote peripheral that disconnected.
     */
    public func central(_ central: BKCentral, remotePeripheralDidDisconnect remotePeripheral: BKRemotePeripheral) {
        print("Disconnect")
    }
}
