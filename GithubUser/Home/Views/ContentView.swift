//
//  ContentView.swift
//  GithubUser
//
//  Created by Bernardo Cervantes Mayagoitia on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var homeVm = HomeVM()
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: homeVm.gHUser?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundStyle(.secondary)
            }
            .frame(width: 120, height: 120)
            
            Text(homeVm.gHUser?.login ?? "Login Placeholder")
                .bold()
                .font(.title3)
            
            Text(homeVm.gHUser?.bio ?? "Bio Placeholder")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do {
                try await self.homeVm.getUser()
            }
            catch {
                print(self.homeVm.errorMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
