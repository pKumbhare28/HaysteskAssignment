//
//  BottomTab.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//
import SwiftUI

struct BottomTabView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView(viewModel: viewModel)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView {
            }
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Catalog")
            }
            
            NavigationView {
                CartView(viewModel: viewModel)
            }
            .tabItem {
                ZStack {
                    Image(systemName: "cart")
                    if viewModel.cart.count > 0 {
                        Text("\(viewModel.cart.count)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Color.green)
                            .clipShape(Circle())
                            .offset(x: 10, y: -10)
                    }
                }
                Text("Cart")
            }
            
            NavigationView {
            }
            .tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
            
            NavigationView {
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}
