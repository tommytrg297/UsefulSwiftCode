//
//  SideMenu.swift
//  SideMenu
//
//  Created by Truong Tommy on 8/5/22.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            VStack(alignment: .leading, spacing: 15) {
                Image(systemName: "star")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                Text("Tommy")
                    .font(.title2.bold())
                Text("@gmail.com")
                    .font(.callout)
                
                HStack(spacing : 12) {
                    Button {
                        
                    } label: {
                        Label {
                            Text("Followers")
                        } icon: {
                            Text("189")
                                .fontWeight(.bold)
                        }
                    }
                
                HStack(spacing : 12) {
                    Button {
                        
                    } label: {
                        Label {
                            Text("Press here")
                        } icon: {
                            Text("190")
                                .fontWeight(.bold)
                        }
                    }
                    }

                }
                .foregroundColor(.primary)
                
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 45) {
                    TabButton(title: "Profile", image: "person.crop.circle" )
                    TabButton(title: "List", image: "list.dash" )
                    TabButton(title: "Topics ", image: "text.badge.star" )
                    TabButton(title: "Bookmarks", image: "bookmark" )
                }
                .padding()
                .padding(.leading)
                .padding(.top,35)
                Divider()
                TabButton(title: "Ads", image: "square.and.arrow.up")
                    .padding()
                    .padding(.leading)
                Divider()
                VStack(alignment: .leading, spacing: 25) {
                    Button("Settings and privacy"){
                    }
                    Button("Help center"){
                        
                    }
                }
                .padding()
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary)
            }
            
            VStack(spacing : 0) {
                Divider()
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "lightbulb")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "qrcode")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                    }
                    

                }
                .padding([.horizontal,.top],15)
            }
        }
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight : .infinity)
        .background(Color.primary
            .opacity(0.04).ignoresSafeArea(.container, edges: .vertical))
        .frame(maxWidth:.infinity,alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title : String, image : String) -> some View {
        Button {
            
        } label: {
            HStack(spacing:14) {
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth : .infinity, alignment: .leading)

        }

    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(showMenu: .constant(false))
    }
}

extension View {
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
