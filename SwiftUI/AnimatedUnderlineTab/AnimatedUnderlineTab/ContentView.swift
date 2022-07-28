//
//  ContentView.swift
//  AnimatedUnderlineTab
//
//  Created by Truong Tommy on 7/27/22.
//

import SwiftUI

struct ContentView: View {
    @State var currentView : Int = 0
    var body: some View {
        ZStack(alignment : .top) {
            TabView(selection: self.$currentView) {
                View1().tag(0)
                View2().tag(1)
                View3().tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            TabBarView(currentTab: $currentView)
                .frame(alignment: .center)
                
        }
    }
}

struct TabBarView : View {
    @Binding var currentTab : Int
    @Namespace var namespace
    var tabBarOptions : [String] = ["Front Side", "Back Side", "Overall"]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center, spacing: 50 ) {
                ForEach(
                    Array(zip(
                        self.tabBarOptions.indices,
                        self.tabBarOptions)),
                    id: \.0) { index,name in
                        TabBarItem(namespace: namespace.self, tabBarItemName: name, currentTab: self.$currentTab, tab: index)
                }
            }
            .padding()
        }
        .background(Color.white)
        .frame(height: 100,alignment: .center)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarItem : View {
    let namespace : Namespace.ID
    var tabBarItemName : String
    @Binding var currentTab : Int
    var tab : Int
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.black
                        .frame(height:2)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace.self,
                                               properties: .frame)
                }
//                else {
//                    Color.clear.frame(height:2)
//                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
