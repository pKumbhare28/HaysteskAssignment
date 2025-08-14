//
//  HaysteskAssignmentApp.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//

import SwiftUI

@main
struct HaysteskAssignmentApp: App {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(viewModel)
        }
    }
}
