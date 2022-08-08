//
//  BaseView.swift
//  SideMenu
//
//  Created by Truong Tommy on 8/5/22.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu : Bool = false
    @State var currentTab = ""
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        let sideBarWidth = getRect().width - 90
        NavigationView {
            HStack(spacing:0) {
                SideMenu(showMenu: $showMenu)
                VStack(spacing:0) {
                    TabView(selection : $currentTab) {
                        Text("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Home")
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Search")
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Notifications")
                        Text("Messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Messages")
                    }
                    HStack(spacing: 0) {
                        
                    }
                }
                .frame(width: getRect().width)
            }
        }
        .frame(width: getRect().width + sideBarWidth)
        .offset(x:sideBarWidth/2)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

