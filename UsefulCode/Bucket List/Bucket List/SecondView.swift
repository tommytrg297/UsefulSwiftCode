//
//  SecondView.swift
//  Bucket List
//
//  Created by Truong Tommy on 4/12/22.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Rectangle()
                .frame(width: 360, height: 5)
                .foregroundColor(.gray)
            VStack {
                
            HStack {
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .foregroundColor(.green)
                Text("Tap leave bus when leaving the bus")
                    .font(.body)
                    .bold()
                    .foregroundColor(.gray)
            }
            HStack {
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .foregroundColor(.green)
                Text("Tap leave bus when leaving the bus")
                    .font(.body)
                    .bold()
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding()
            HStack {
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .foregroundColor(.green)
                Text("Tap leave bus when leaving the bus")
                    .font(.body)
                    .bold()
                    .foregroundColor(.gray)
            }
            .padding()
            HStack {
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .foregroundColor(.green)
                Text("Tap leave bus when leaving the bus")
                    .font(.body)
                    .bold()
                    .foregroundColor(.gray)
            }
            .padding()
            
            }
            
            Rectangle()
                .frame(width: 360, height: 5)
                .foregroundColor(.gray)
                .cornerRadius(.greatestFiniteMagnitude)
            
                
                
            
        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
