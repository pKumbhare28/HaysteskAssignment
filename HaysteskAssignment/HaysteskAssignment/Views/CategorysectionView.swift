//
//  CategorySectionView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import SwiftUI
struct CategorySectionView: View {
    let categories = [
        ("Phones", "iphone"),
        ("Consoles", "gamecontroller"),
        ("Laptops", "laptopcomputer"),
        ("Cameras", "camera")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Categories")
                    .font(.headline)
                Spacer()
                Text("See all")
                    .foregroundColor(.green)
                    .font(.subheadline)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(categories, id: \.0) { category in
                        VStack {
                            Circle()
                                .fill(Color(.systemGray6))
                                .frame(width: 60, height: 60)
                                .overlay(Image(systemName: category.1))
                            Text(category.0)
                                .font(.caption)
                        }
                    }
                }
            }
        }
    }
}
