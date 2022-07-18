//
//  MockData.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/11/22.
//

import Foundation

extension User {
    static var mockUsers :[User] {
        Bundle.main.decode([User].self, from: "users.json")
    }
    static var mockSingleUser : User {
        Self.mockUsers[0]
    }
}

extension Post {
    static var mockPosts :[Post] {
        Bundle.main.decode([Post].self, from: "posts.json")
    }
    static var mockSinglePost : Post {
        Self.mockPosts[0]
    }
    static var mockSingleUsersPostArray:[Post] {
        Self.mockPosts.filter { post in
            post.userId == 1 // $0.userId == 0 also works
        }
    }
}
