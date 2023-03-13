//
//  AddToCartDomain.swift
//  TCA-Demo
//
//  Created by Pedro Gomes Rubbo Pacheco on 08/03/23.
//

import ComposableArchitecture
import Foundation

struct AddToCartDomain {
    struct State: Equatable {
        var count = 0
    }

    enum Action: Equatable {
        case didTapPlusButton
        case didTapMinusButton
    }

    struct Reducer: ReducerProtocol {
        typealias Action = AddToCartDomain.Action
        typealias State = AddToCartDomain.State

        func reduce(into state: inout AddToCartDomain.State, action: AddToCartDomain.Action) -> EffectTask<AddToCartDomain.Action> {
            switch action {
            case .didTapPlusButton:
                state.count += 1
                return .none
            case .didTapMinusButton:
                state.count -= 1
                return .none
            }
        }
    }
    
}
