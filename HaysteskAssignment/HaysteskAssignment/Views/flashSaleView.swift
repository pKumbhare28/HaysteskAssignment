//
//  FlashSaleSectionView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import SwiftUI

struct FlashSaleSectionView: View {
    let products: [Product]
    let toggleCart: (Product) -> Void
    let cart: [Product]
    let viewModel: ProductViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Flash Sale")
                    .font(.headline)
                Spacer()
                Text("02:59:23")
                    .padding(5)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(5)
                Text("See all")
                    .foregroundColor(.green)
                    .font(.subheadline)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(products) { product in
                        NavigationLink(
                            destination: ProductDetailView(product: product, viewModel: viewModel)
                        ) {
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: product.image)) { img in
                                    img.resizable().scaledToFit()
                                } placeholder: {
                                    Color.gray.opacity(0.3)
                                }
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                                
                                Text(product.title)
                                    .font(.subheadline)
                                    .lineLimit(1)
                                
                                Text("£\(product.price, specifier: "%.2f")")
                                    .bold()
                            }
                            .frame(width: 150)
                        }
                        .buttonStyle(PlainButtonStyle())

                    }
                }
            }
        }
    }
}
