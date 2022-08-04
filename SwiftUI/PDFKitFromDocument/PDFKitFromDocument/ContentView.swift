//
//  ContentView.swift
//  PDFKitFromDocument
//
//  Created by Truong Tommy on 8/4/22.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    var body: some View {
        VStack{
            PDFViewRepresentable()
        }
        .ignoresSafeArea()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PDFViewRepresentable : UIViewRepresentable {
    let view = UIView()
    let pdfView = PDFView()
    let thumbnailView = PDFThumbnailView()
    
    func makeUIView(context: Context) -> UIView {
        guard let path = Bundle.main.url(forResource: "file", withExtension: "pdf") else { return UIView()}
        if let pdfDoc = PDFDocument(url: path){
            pdfView.document = pdfDoc
        }
        pdfView.displayMode = .singlePage
        pdfView.autoScales = true
        pdfView.usePageViewController(true)
        
        view.addSubview(pdfView)

        view.addSubview(thumbnailView)
        thumbnailView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        thumbnailView.pdfView = pdfView
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false

        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let pdfView = uiView as? PDFView else { return }
    }
}
