//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Truong Tommy on 8/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @State var presented = false
    
    let icons = ["house","gear","plus","lasso","message"]
    
    var body: some View {
        VStack {
            // Content
            ZStack {
                Spacer().fullScreenCover(isPresented: $presented) {
                    Button {
                        presented.toggle()
                    } label: {
                        Text("Go back")
                            .frame(width: 200, height: 50)
                            .background(.pink)
                            .cornerRadius(12)
                    }

                }
                switch selectedIndex {
                case 0 :
                    HomeView()
                case 1 :
                    NavigationView{
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Settings")
                    }
                case 2 :
                    NavigationView{
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Add")
                    }
                case 3 :
                    NavigationView{
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Edit")
                    }
                
                default:
                    NavigationView{
                        VStack {
                            Text("Second Screen")
                        }
                        .navigationTitle("Message")
                    }
                }
            }
            
            Divider()
            HStack {
                ForEach(0..<5, id:\.self) { num in
                    Spacer()
                    Button {
                        if num == 2 {
                            self.presented.toggle()
                        }
                        else {
                            self.selectedIndex = num
                            print(selectedIndex)
                        }
                    } label: {
                        if num == 2 {
                            Image(systemName: icons[num])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color.blue)
                                .cornerRadius(30)
                                
                        }
                        else {
                            Image(systemName: icons[num])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex==num ? .blue : .black)
                        }
                        
                    }
                    Spacer()

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct HomeView : View {
    var body: some View {
        NavigationView {
            VStack {
                Text("First screen")
            }
            .navigationTitle("Home")
        }
    }
}
