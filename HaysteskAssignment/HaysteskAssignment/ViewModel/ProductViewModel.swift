//
//  ProductViewModel.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import Foundation

@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var cart: [Product] = []
    @Published var selectedProduct: Product?
    @Published var showCart = false
    @Published var showThankYou = false
    @Published var quantities: [Int: Int] = [:] // key: product.id

    func fetchProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([Product].self, from: data) {
                    DispatchQueue.main.async {
                        self.products = decoded
                    }
                }
            }
        }.resume()
    }
    
    func addToCart(_ product: Product) {
        cart.append(product)
    }
    func increaseQuantity(_ product: Product) {
            quantities[product.id, default: 1] += 1
        }
        
        func decreaseQuantity(_ product: Product) {
            if let current = quantities[product.id], current > 1 {
                quantities[product.id] = current - 1
            }
        }
        
        func quantity(for product: Product) -> Int {
            quantities[product.id, default: 1]
        }
    func removeFromCart(_ product: Product) {
        cart.removeAll { $0.id == product.id }
    }
    
    func checkout() {
        cart.removeAll()
        showThankYou = true
    }
    func toggleCart(product: Product) {
        if cart.contains(product) {
            cart.removeAll { $0 == product }
        } else {
            cart.append(product)
        }
    }
}
