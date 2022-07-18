//
//  PostsListViewModel.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/12/22.
//

import Foundation

class PostsListViewModel : ObservableObject {
    @Published var posts :[Post] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage : String?

    var userID : Int?
    
    @MainActor
    func fetchPosts() async {
        if let userID = userID {
        let apiServices = APIServices(urlString: "https://jsonplaceholder.typicode.com/users/\(userID)/posts")
        isLoading.toggle()
        defer{
            self.isLoading.toggle()
        }
        do {
            posts = try await apiServices.getJSON()
        } catch  {
            self.showAlert = true
        }
        }
        
        
    }
}

extension PostsListViewModel {
    convenience init(forPreview : Bool = false) {
        self.init()
        if forPreview {
            self.posts = Post.mockSingleUsersPostArray
        }
    }
}
