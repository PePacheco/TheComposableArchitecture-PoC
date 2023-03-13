//
//  ProductListDomain.swift
//  TCA-Demo
//
//  Created by Pedro Gomes Rubbo Pacheco on 12/03/23.
//

import ComposableArchitecture
import Foundation

struct ProductListDomain {
    
    struct State: Equatable {
        var products: IdentifiedArrayOf<ProductDomain.State> = []
    }
    
    enum Action: Equatable {
        case fetchProducts
        case fetchProductsResponse(TaskResult<[Product]>)
        case row(id: ProductDomain.State.ID, action: ProductDomain.Action)
    }
    
    struct Reducer: ReducerProtocol {
        typealias State = ProductListDomain.State
        typealias Action = ProductListDomain.Action
        
        var fetchProducts: @Sendable () async throws -> [Product]
        
        func core(state: inout State, action: Action) -> EffectTask<Action> {
            switch action {
            case .fetchProducts:
                return .task {
                    await .fetchProductsResponse(
                        TaskResult {
                            try await self.fetchProducts()
                        }
                    )
                }
            case .fetchProductsResponse(.success(let products)):
                state.products = IdentifiedArray(uniqueElements: products.map { ProductDomain.State(id: UUID(), product: $0) })
                return .none
            case .fetchProductsResponse(.failure(let error)):
                print("Error: \(error)")
                return .none
            case .row:
                return .none
            }
        }
        
        var body: some ReducerProtocol<State, Action> {
            Reduce(self.core)
                .forEach(\.products, action: /Action.row) {
                    ProductDomain.Reducer()
                }
        }
    }
    
}
