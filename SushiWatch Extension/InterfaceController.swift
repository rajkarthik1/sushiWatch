//
//  InterfaceController.swift
//  SushiWatch Extension
//
//  Created by Karthik Raj  on 2019-11-04.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    @IBAction func LeftButton() {
        print("Left button pressed")

               if(WCSession.default.isReachable == true){
        //            Here is the message you want to send to the watch
                   let message = ["name":"left"] as [String : Any]
                   WCSession.default.sendMessage(message, replyHandler: nil)
                   }
                   else {
                
                   }
    }
    
    @IBAction func RightButton() {
        print("Right button pressed")
                  // ------ SEND MESSAGE TO WATCH CODE GOES HERE

               if(WCSession.default.isReachable == true){
        //            Here is the message you want to send to the watch
           let message = ["name":"right"] as [String : Any]
                   WCSession.default.sendMessage(message, replyHandler: nil)
                   }
                   else {
                  print("helloworld")
                   }
    }

    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
           // Output message to terminal
           print("WATCH: I received a message: \(message)")
           
           // Get the "name" key out of the dictionary
           // and show it in the label
           let name = message["name"] as! String
           
           print(name)
        
    }
       
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
               super.willActivate()
            //communication session between watch and phone
               if(WCSession.isSupported() == true){
                   print("connected")
                let session = WCSession.default
                session.delegate = self
                session.activate()
                }
                else {
                   print("Not connecting")
                }
               
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
