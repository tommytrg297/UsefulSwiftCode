//
//  ViewController.swift
//  NFC Reader
//
//  Created by Truong Tommy on 7/5/22.
//

import UIKit
import CoreNFC

class ViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    

    @IBOutlet weak var NFCText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    
    var NFCSession : NFCNDEFReaderSession?
    var word = "None"
    
    @IBAction func ScanButton(_ sender: Any) {
        NFCSession = NFCNDEFReaderSession.init(
            delegate: self,
            queue: nil,
            invalidateAfterFirstRead: true)
        NFCSession?.begin()
       
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("Session Invalidated : \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var result = ""
        for payload in messages[0].records {
            result += String.init(data: payload.payload.advanced(by: 3), encoding: .utf8) ?? "Wrong format"
        }
        DispatchQueue.main.async {
            self.NFCText.text = result
        }
    }
    
     
    
}

