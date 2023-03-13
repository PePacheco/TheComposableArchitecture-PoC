//
//  ProductDomain.swift
//  TCA-Demo
//
//  Created by Pedro Gomes Rubbo Pacheco on 10/03/23.
//

import ComposableArchitecture
import Foundation

struct ProductDomain {
    
    struct State: Equatable, Identifiable {
        let id: UUID
        let product: Product
        var addToCartState = AddToCartDomain.State()
    }
    
    enum Action: Equatable {
        case addToCart(AddToCartDomain.Action)
    }

    struct Reducer: ReducerProtocol {
        typealias Action = ProductDomain.Action
        typealias State = ProductDomain.State
        
        func core(state: inout State, action: Action) -> EffectTask<Action> {
            switch action {
            case .addToCart(.didTapPlusButton):
                return .none
            case .addToCart(.didTapMinusButton):
                state.addToCartState.count = max(0, state.addToCartState.count)
                return .none
            }
        }
        
        var body: some ReducerProtocol<State, Action> {
            Scope(state: \.addToCartState, action: /Action.addToCart) {
                AddToCartDomain.Reducer()
            }
            
            Reduce(self.core)
        }
    }
    
}
