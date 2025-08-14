//
//  ProductDetailView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @ObservedObject var viewModel: ProductViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Top Bar
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding(10)
                        .background(Color.white.opacity(0.9))
                        .clipShape(Circle())
                }
                
                Spacer()
                
                Button(action: {
                    if viewModel.cart.contains(where: { $0.id == product.id }) {
                        viewModel.removeFromCart(product)
                    } else {
                        viewModel.addToCart(product)
                    }
                }) {
                    Image(systemName: viewModel.cart.contains(where: { $0.id == product.id }) ? "heart.fill" : "heart")
                        .font(.title3)
                        .foregroundColor(viewModel.cart.contains(where: { $0.id == product.id }) ? .red : .black)
                        .padding(10)
                        .background(Color.white.opacity(0.9))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            ScrollView(showsIndicators: false) {
                
                // MARK: - Image Carousel
                TabView {
                    AsyncImage(url: URL(string: product.image)) { img in
                        img.resizable().scaledToFit()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: 250)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 270)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
                .padding(.top, 10)
                
                // MARK: - Product Info Card
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text(product.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    // Rating Badges
                    HStack(spacing: 8) {
                        Label("4.8", systemImage: "star.fill")
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.yellow.opacity(0.2))
                            .clipShape(Capsule())
                        
                        Text("117 reviews")
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(.systemGray5))
                            .clipShape(Capsule())
                        
                        Text("94%")
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.2))
                            .clipShape(Capsule())
                        
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            Text("8")
                        }
                        .font(.subheadline)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(.systemGray5))
                        .clipShape(Capsule())
                    }
                    
                    // Price
                    Text("£\(product.price, specifier: "%.2f")")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    // Description
                    Text(product.description)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .lineLimit(3)
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
                .padding(.top, 10)
            }
            
            // MARK: - Bottom Add to Cart
            VStack(spacing: 8) {
                Button(action: {
                    if viewModel.cart.contains(where: { $0.id == product.id }) {
                        viewModel.removeFromCart(product)
                    } else {
                        viewModel.addToCart(product)
                    }
                }) {
                    Text(viewModel.cart.contains(where: { $0.id == product.id }) ? "Remove from Cart" : "Add to Cart")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(12)
                }
                
                Text("Delivery on 26 October")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -2)
        }
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}
