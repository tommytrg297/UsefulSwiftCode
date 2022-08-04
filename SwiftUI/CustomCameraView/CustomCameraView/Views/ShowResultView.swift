//
//  ShowResultView.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/26/22.
//

import SwiftUI

struct ShowResultView: View {
    @Binding var image : UIImage
    @State var data : NewVietnameseIDFrontData?
    var body: some View {
        VStack {
            List {
                Section {
                    Text("So CCCD: " + (data?.id ?? ""))
                    Text("Ten ho: " + (data?.name ?? ""))
                    Text("Ngay sinh: " + (data?.dob ?? ""))
                    Text("Gioi tinh: " + (data?.sex ?? ""))
                    Text("Quoc tich: " + (data?.nationality ?? ""))
                    Text("Que quan: " + (data?.home ?? ""))
                    Text("Noi thuong tru: " + (data?.address ?? ""))
                    Text("Het han vao: " + (data?.doe ?? ""))
                    } header: {
                        Text("Information")
                    }
                Section {
                    Text("So CCCD: " + (data?.idProb ?? "") + "%")
                    Text("Ten ho: " + (data?.nameProb ?? "") + "%")
                    Text("Ngay sinh: " + (data?.dobProb ?? "") + "%")
                        Text("Gioi tinh: " + (data?.sexProb ?? "") + "%")
                        Text("Quoc tich: " + (data?.nationalityProb ?? "") + "%")
                        Text("Que quan: " + (data?.homeProb ?? "") + "%")
                        Text("Noi thuong tru: " + (data?.addressProb ?? "") + "%")
                        Text("Cap ngay: " + (data?.doeProb ?? "") + "%")
                    } header: {
                        Text("Accuracy")
                    }
            }
        }
        .task {
            fetchData()
        }
    }
    private func fetchData() {
        APICaller.shared.getInformationFromDocument(
            image: image,
            documentType: .identityCard){  result in
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

struct ShowResultView_Previews: PreviewProvider {
    static var previews: some View {
        ShowResultView(image: .constant(UIImage(systemName: "star")!),data: NewVietnameseIDFront.cccdPhat.data[0])
    }
}
