//
//  ViewController.swift
//  PDFKitDemo
//
//  Created by Truong Tommy on 6/30/22.
//

import PDFKit
import UIKit

class ViewController: UIViewController, PDFViewDelegate{
    let pdfView = PDFView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pdfView)
        guard let url = Bundle.main.url(forResource: "pdfdoc1", withExtension: "pdf") else {
            return
        }
        guard let document = PDFDocument(url: url) else {
            return
        }
        pdfView.document = document
        pdfView.delegate = self
        
        let newDocument = PDFDocument()
        guard let page = PDFPage(image: UIImage(systemName: "house")!) else {
            return
        }
        newDocument.insert(page, at: 0)
        
        pdfView.document = newDocument
        
        
        
        
        
        
        

        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }


}

