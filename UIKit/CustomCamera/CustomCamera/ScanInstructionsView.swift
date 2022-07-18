//
//  ScanInstructionsView.swift
//  CustomCamera
//
//  Created by Truong Tommy on 7/14/22.
//

import SwiftUI

struct ScanInstructionsView: View {
    @State private var capturedImage : UIImage
    
    init(capturedImage : UIImage) {
        self.capturedImage = capturedImage
    }
    var body: some View {
        VStack {
            Image(uiImage: capturedImage)
            Text("Can cuoc cong dan (mac truoc)")
        }
    }
}





struct ScanInstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        ScanInstructionsView(capturedImage: UIImage(systemName: "person")!)
    }
}
