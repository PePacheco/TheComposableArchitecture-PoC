//
//  File.swift
//  TCA-Demo
//
//  Created by Pedro Gomes Rubbo Pacheco on 10/03/23.
//

import ComposableArchitecture
import Foundation

struct Product: Equatable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let imageString: String
}

extension Product {
    static var sample: [Product] {
        [
            .init(
                  id: 1,
                  title: "Men Premium T-Shirt",
                  price: 25.0,
                  description: "A really beautiful t-shirt made out of premium cotton.",
                  category: "men's clothing",
                  imageString: "tshirt"
            ),
            .init(
                  id: 2,
                  title: "Adventurer Backpack",
                  price: 119.9,
                  description: "The perfect backpack, made for hiking enthusiasts.",
                  category: "men's clothing",
                  imageString: "bag"
            ),
            .init(
                  id: 3,
                  title: "Hiking Jacket",
                  price: 55.0,
                  description: "Incredible outerwear jacket for Spring/Autumn/Winter.",
                  category: "men's clothing",
                  imageString: "jacket"
            )
        ]
    }
}
