//
//  AddressBarView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//
import SwiftUI
struct AddressBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "location.fill")
                .foregroundColor(.gray)
            Text("92 High Street, London")
                .font(.subheadline)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

struct SelectAllView: View {
    var allSelected: Bool
    var toggleAll: () -> Void
    
    var body: some View {
        HStack {
            Button(action: toggleAll) {
                Image(systemName: allSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.green)
            }
            Text("Select all")
            Spacer()
            Image(systemName: "square.and.arrow.up")
            Image(systemName: "square.and.pencil")
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

struct CartItemRow: View {
    let product: Product
    let isSelected: Bool
    let toggleSelection: () -> Void
    let increase: () -> Void
    let decrease: () -> Void
    let quantity: Int
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: toggleSelection) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.green)
            }
            
            AsyncImage(url: URL(string: product.image)) { img in
                img.resizable()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 60, height: 60)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.subheadline)
                    .lineLimit(2)
                Text("£\(product.price, specifier: "%.2f")")
                    .bold()
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                Button(action: decrease) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.gray)
                }
                Text("\(quantity)")
                    .frame(width: 20)
                Button(action: increase) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1)
        .padding(.horizontal)
    }
}

struct CheckoutBar: View {
    var totalPrice: Double
    var checkoutAction: () -> Void
    
    var body: some View {
        VStack {
            Button(action: checkoutAction) {
                Text("Checkout — £\(totalPrice, specifier: "%.2f")")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
        .background(Color(.systemBackground).shadow(radius: 2))
    }
}
