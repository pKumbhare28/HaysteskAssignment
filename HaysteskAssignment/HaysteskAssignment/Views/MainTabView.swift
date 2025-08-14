//
//  MainTabView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, catalog, cart, favorites, profile
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Main Content
            Group {
                switch selectedTab {
                case .home:
                    NavigationStack {
                        HomeView(viewModel: viewModel)
                    }
                case .catalog:
                    NavigationStack {
//                        CatalogView()
                    }
                case .cart:
                    NavigationStack {
                        CartView(viewModel: viewModel)
                    }
                case .favorites:
                    NavigationStack {
//                        FavoritesView(viewModel: viewModel)
                    }
                case .profile:
                    NavigationStack {
//                        ProfileView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Custom Tab Bar
            CustomTabBar(
                selectedTab: $selectedTab,
                cartCount: viewModel.cart.count
            )
        }
        .ignoresSafeArea(.keyboard, edges: .bottom) // avoid keyboard pushing tab bar
    }
}
