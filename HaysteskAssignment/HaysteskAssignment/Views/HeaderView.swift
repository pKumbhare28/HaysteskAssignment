//
//  HeaderView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import SwiftUI
struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Delivery address")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("92 High Street, London")
                    .font(.headline)
            }
            Spacer()
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 36, height: 36)
                .overlay(Image(systemName: "person.fill"))
        }
    }
}
