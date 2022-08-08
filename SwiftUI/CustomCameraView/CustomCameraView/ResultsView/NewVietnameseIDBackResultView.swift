//
//  NewVietnameseIDBackResultView.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 8/4/22.
//  Copyright © 2022 FPT. All rights reserved.
//

import SwiftUI

struct NewVietnameseIDBackResultView: View {
    @Binding var image : UIImage
    @State var data : NewVietnameseIDBackData?
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text("Ngay cap: " + (data?.issueDate ?? ""))
                    Text("Dac diem: " + (data?.features ?? ""))
                    Text("Loai the: " + (data?.type ?? ""))
                }
            }
            .task {
                fetchData()
            }
        }
    }
    private func fetchData() {
        APICaller.shared.getInformationFromNewNationalIDBack(image: image) {  result in
                switch result {
                case .success(let retrievedData):
                    print(retrievedData[0])
                    self.data = retrievedData[0]
                case .failure(let error):
                    print(error)
            }
        }
    }
}


