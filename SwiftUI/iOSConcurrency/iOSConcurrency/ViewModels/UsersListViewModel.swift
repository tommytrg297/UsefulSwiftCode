//
//  UsersListViewModel.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/11/22.
//

import Foundation

class UsersListViewModel : ObservableObject {
  
    @Published var usersAndPosts : [UserAndPost] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage : String?
    
    @MainActor
    func fetchUsers() async {
        let apiService = APIServices(urlString: "https://jsonplaceholder.typicode.com/users")
        let apiService2 = APIServices(urlString: "https://jsonplaceholder.typicode.com/posts")
        isLoading.toggle()
        defer{
            self.isLoading.toggle()
        }
        do {
            async let users : [User] = try await apiService.getJSON()
            async let posts : [Post] = try await apiService2.getJSON()
            let (fetchedUsers, fetchedPosts) = await (try users,try posts)
            for user in fetchedUsers {
                let userPosts = fetchedPosts.filter { post in
                    post.userId == user.id // $0.userId == user.Id
                }
                let newUserAndPosts =  UserAndPost(user: user, posts: userPosts)
                usersAndPosts.append(newUserAndPosts)
            }
        } catch  {
            self.showAlert = true
        }
    }
}

extension UsersListViewModel {
    convenience init(forPreview : Bool = false) {
        self.init()
        if forPreview {
            self.usersAndPosts = UserAndPost.mockUsersAndPosts
        }
    }
}
