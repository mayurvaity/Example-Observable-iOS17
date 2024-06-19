//
//  ContentView.swift
//  Example-Observable-iOS17
//
//  Created by Mayur Vaity on 19/06/24.
//

import SwiftUI

class User: ObservableObject {
    @Published var name: String
    @Published var jobTitle: String
    @Published var followerCount: Int
    @Published var bio: String
    
    init(name: String, jobTitle: String, followerCount: Int, bio: String) {
        self.name = name
        self.jobTitle = jobTitle
        self.followerCount = followerCount
        self.bio = bio
    }
}

struct ContentView: View {
    
    @StateObject var user = User(name: "Mayur Vaity",
                                 jobTitle: "iOS Dev",
                                 followerCount: 99,
                                 bio: "My bio goes here")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.title.bold())
            Text(user.jobTitle)
                .foregroundStyle(.secondary)
            
            Text("\(user.followerCount) Followers")
                .foregroundStyle(.secondary)
            
            Button {
                user.followerCount += 1
            } label: {
                Text("Add follower")
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 30)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
