//
//  SearchBarView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import SwiftUI
struct SearchBarView: View {
    @State private var searchText = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search the entire shop", text: $searchText)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color(.systemGray6))
        .cornerRadius(25)
    }
}
