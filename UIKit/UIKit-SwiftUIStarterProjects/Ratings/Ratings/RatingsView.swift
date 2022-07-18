//
//  RatingsView.swift
//  Ratings
//
//  Created by Truong Tommy on 7/16/22.
//

import SwiftUI

struct RatingsView: View {
    @State var currentRating : Int = 0
    var passedInRating : Int
    var maxRating = 5
    var color:UIColor = UIColor.systemYellow
    var width: Int = 25
    var fillImageName = "star.fill"
    var openImageName = "star"
    var body: some View {
        VStack {
        HStack(spacing: 5) {
            ForEach(0..<maxRating) { rating in
                Image(systemName: rating < currentRating ? fillImageName : openImageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(self.color))
                    .onTapGesture {
                        currentRating = rating + 1
                }
            }
        }
        .frame(width: CGFloat(maxRating * width))
            HStack {
                Image(systemName: "clear.fill")
                    .foregroundColor(.red)
                    .onTapGesture {
                        currentRating = 0
                    }
                Text(currentRating == 0 ? "No Rating" : "Rating: \(currentRating)")
            }
        }
        .onAppear {
            currentRating = passedInRating
        }
    }
}

struct RatingsView_Previews : PreviewProvider {
    static var previews: some View{
        RatingsView(passedInRating: 0)
    }
}
