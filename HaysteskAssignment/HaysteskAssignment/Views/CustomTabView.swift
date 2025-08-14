//
//  CustomTabBar.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import SwiftUI
struct CustomTabBar: View {
    @Binding var selectedTab: MainTabView.Tab
    var cartCount: Int
    
    var body: some View {
        HStack {
            TabBarButton(icon: "house.fill", title: "Home", tab: .home, selectedTab: $selectedTab)
            TabBarButton(icon: "square.grid.2x2", title: "Catalog", tab: .catalog, selectedTab: $selectedTab)
            
            ZStack {
                TabBarButton(icon: "cart.fill", title: "Cart", tab: .cart, selectedTab: $selectedTab)
                if cartCount > 0 {
                    Text("\(cartCount)")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color.black)
                        .clipShape(Circle())
                        .offset(x: 12, y: -10)
                }
            }
            
            TabBarButton(icon: "heart", title: "Favorites", tab: .favorites, selectedTab: $selectedTab)
            TabBarButton(icon: "person", title: "Profile", tab: .profile, selectedTab: $selectedTab)
        }
        .padding(.top, 8)
        .padding(.bottom, 12)
        .background(Color.white.shadow(radius: 2))
    }
}

struct TabBarButton: View {
    var icon: String
    var title: String
    var tab: MainTabView.Tab
    @Binding var selectedTab: MainTabView.Tab
    
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            VStack {
                Image(systemName: icon)
                Text(title).font(.caption2)
            }
            .foregroundColor(selectedTab == tab ? .green : .black)
            .frame(maxWidth: .infinity)
        }
    }
}
