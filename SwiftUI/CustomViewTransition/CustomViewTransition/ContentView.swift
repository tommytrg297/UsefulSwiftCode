//
//  ContentView.swift
//  CustomViewTransition
//
//  Created by Truong Tommy on 7/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var tapped = false
    @Namespace var namespace
    
    var body: some View {
        ZStack{
            // FROM
            if !tapped {
                VStack(alignment: .leading) {
                    Text("SwiftUI")
                        .font(.title.weight(.bold))
                        .padding()
                        .matchedGeometryEffect(id: "title", in: namespace)
                    
                    Text("A demo about custom transitions")
                        .font(.title.weight(.medium))
                        .padding()
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    
                    Text("How to transition from one view to another")
                        .font(.footnote.weight(.regular))
                        .padding()
                        .matchedGeometryEffect(id: "footnote", in: namespace)

                }
                .frame(width: 200,alignment: .leading)
                .background(.blue)
                .cornerRadius(20)
                .shadow(color: Color(.secondaryLabel), radius: 12, x: 0, y: 10)
                .matchedGeometryEffect(id: "card", in: namespace)

            } // TO
            else {
                VStack(alignment: .leading) {
                    Text("SwiftUI")
                        .font(.title.weight(.bold))
                        .padding()
                        .matchedGeometryEffect(id: "title", in: namespace)

                    Text("A demo about custom transitions")
                        .font(.title.weight(.medium))
                        .padding()
                        .matchedGeometryEffect(id: "subtitle", in: namespace)

                    Text("How to transition from one view to another")
                        .font(.footnote.weight(.regular))
                        .padding()
                        .matchedGeometryEffect(id: "footnote", in: namespace)

                    Spacer()
                }
                .frame(width: 350,alignment: .leading)
                .background(.blue)
                .cornerRadius(20)
                .shadow(color: Color(.secondaryLabel), radius: 12, x: 0, y: 10)
                .matchedGeometryEffect(id: "card", in: namespace)

            }
            
            
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                tapped.toggle()
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
