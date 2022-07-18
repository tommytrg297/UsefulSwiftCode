//
//  UserAndPost.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/13/22.
//

import Foundation

struct UserAndPost: Identifiable {
    var id = UUID()
    let user : User
    let posts : [Post]
    var numberOfPost : Int {
        return posts.count
    }
}

extension UserAndPost {
    static var mockUsersAndPosts : [UserAndPost] {
        var newUsersAndPosts : [UserAndPost] = []
        for user in User.mockUsers {
            let newUserAndPosts = UserAndPost(user: user, posts: Post.mockPosts.filter{$0.id == user.id})
            newUsersAndPosts.append(newUserAndPosts)
        }
    return newUsersAndPosts
    }
}
