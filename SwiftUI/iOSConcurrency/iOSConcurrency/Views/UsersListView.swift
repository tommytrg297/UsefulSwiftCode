//
//  UsersListView.swift
//  iOSConcurrency
//
//  Created by Truong Tommy on 7/11/22.
//

import SwiftUI

struct UsersListView: View {
    #warning("Remove the preview argument when shipping app OR set it to false")
    @StateObject var vm = UsersListViewModel(forPreview: false)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.usersAndPosts) { userAndPost in
                    NavigationLink {
                        PostsListView(posts : userAndPost.posts)
                    } label: {
                        VStack {
                            HStack {
                                Text(userAndPost.user.name)
                                    .font(.title)
                                Spacer()
                                Text("\(userAndPost.numberOfPost)")
                            }
                            Text(userAndPost.user.email)
                        }
                    }

                }
            }
            .overlay(content: {
                if vm.isLoading {
                    ProgressView()
                }
            })
            .alert("Application Error", isPresented: $vm.showAlert, actions: {
                Button("OK"){}
            },message: {
                if let errorMessage = vm.errorMessage {
                    Text(errorMessage)
                }
            })

            .navigationTitle("Users")
            .listStyle(.plain)
            .task {
                await vm.fetchUsers()
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
