//
//  OfferBannerView.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//
import SwiftUI
struct OfferBannerView: View {
    var body: some View {
        HStack {
            Text("Delivery is")
                .font(.subheadline)
            Text("50%")
                .bold()
                .foregroundColor(.green)
            Text("cheaper")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
