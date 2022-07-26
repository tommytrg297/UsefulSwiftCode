//
//  SettingsView.swift
//  CustomCameraView
//
//  Created by Truong Tommy on 7/19/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @EnvironmentObject var config : Configuration
    
    var body: some View {
        VStack {
            Form {
                            Section {
                                TextField("abcde-1234", text: $config.APIKey)
                            } header: {
                                Text("API Key")
                            }
                            Section {
                                Picker("\(config.OCRType.rawValue)", selection: $config.OCRType) {
                                    ForEach(OCRType.allCases, id:\.self) { type in
                                        Text(type.id)
                                    }
                                }
                                .pickerStyle(.segmented)

                            } header: {
                                Text("OCR Type")
                            }

                            Section {
                                Picker("Type of document", selection: $config.OCRDocument) {
                                    ForEach(OCRDocumentType.allCases, id:\.self) { type in
                                        Text(type.rawValue)
                                    }
                                }
                                .pickerStyle(.menu)
                            } header: {
                                Text("OCR Document Type")
                            }

                            Section{
                                ColorPicker("\(config.color.description)", selection: $config.color)
                                    .pickerStyle(.segmented)
                            }header : {
                                Text("Choose color")
                            }
                
                            Section {
                                Toggle("Show final result", isOn: $config.showFinalScreenResult)
                                Toggle("Submit result", isOn: $config.submitResultToFPTServer)
                            }
                        }
                .navigationViewStyle(.stack)
                .navigationTitle("Configurations")
                .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            Button("Save"){
                
            }
        }

            
        
    }
}
    
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(Configuration(
            APIKey: "",
            OCRType: .photo,
            OCRDocument: .passport,
            captureMode: .manual,
            color: .purple,
            showFinalScreenResult: false,
            submitResultToFPTServer: false))
    }
}
