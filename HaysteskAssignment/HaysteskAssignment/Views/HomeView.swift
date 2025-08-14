//
//  HomeView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ProductViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Custom Header
            HStack {
                Image(systemName: "location.circle.fill")
                    .foregroundColor(.green)
                    .font(.title2)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Delivery address")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Text("92 High Street, London")
                        .font(.system(size: 15, weight: .medium))
                }
                Spacer()
                Image(systemName: "person.crop.circle")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            // MARK: - Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                Text("Search the entire shop")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.top, 4)
            
            // MARK: - Offer Banner
            HStack {
                Text("Delivery is ")
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                Text("50%")
                    .foregroundColor(.green)
                    .bold()
                Text(" cheaper")
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.top, 4)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    // MARK: - Categories
                    HStack {
                        Text("Categories")
                            .font(.headline)
                        Spacer()
                        Text("See all")
                            .foregroundColor(.green)
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 24) {
                            CategoryButton(icon: "iphone", title: "Phones")
                            CategoryButton(icon: "gamecontroller", title: "Consoles")
                            CategoryButton(icon: "laptopcomputer", title: "Laptops")
                            CategoryButton(icon: "camera", title: "Cameras")
                            CategoryButton(icon: "headphones", title: "Audio")
                        }
                        .padding(.horizontal)
                    }
                    
                    // MARK: - Flash Sale
                    HStack {
                        Text("Flash Sale")
                            .font(.headline)
                        Spacer()
                        Text("02:59:23")
                            .font(.system(size: 12))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(6)
                        Text("See all")
                            .foregroundColor(.green)
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    // MARK: - Products
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(viewModel.products) { product in
                                ProductCard(product: product)
                                    .onTapGesture {
                                        viewModel.selectedProduct = product
                                    }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 80) // keeps space for custom bottom bar
                    }
                    .fullScreenCover(item: $viewModel.selectedProduct) { product in
                        ProductDetailView(product: product, viewModel: viewModel)
                    }
                }
            }
        }
        .onAppear {
            if viewModel.products.isEmpty {
                viewModel.fetchProducts()
            }
        }
        
    }
}

// MARK: - Components (same as before)

struct CategoryButton: View {
    var icon: String
    var title: String
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .fill(Color(.systemGray6))
                    .frame(width: 60, height: 60)
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(.black)
            }
            Text(title)
                .font(.system(size: 12))
        }
    }
}

struct ProductCard: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Rectangle()
                .fill(Color(.systemGray5))
                .frame(width: 150, height: 150)
                .overlay(
                    AsyncImage(url: URL(string: product.image)) { img in
                        img.resizable().scaledToFit()
                    } placeholder: {
                        Image(systemName: "photo")
                    }
                )
            Text(product.title)
                .font(.system(size: 13))
                .lineLimit(1)
            Text("£\(product.price, specifier: "%.2f")")
                .font(.system(size: 14, weight: .bold))
        }
        .frame(width: 150)
    }
}
