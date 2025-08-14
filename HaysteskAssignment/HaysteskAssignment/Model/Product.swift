//
//  Product.swift
//  HaysteskAssignment
//
//  Created by Pratiksha Kumbhare on 14/08/25.
//
import Foundation

struct Product: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let image: String
    let rating: Rating
}

struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}
