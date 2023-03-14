//
//  AddToCardReducerTests.swift
//  TCA-DemoTests
//
//  Created by Pedro Gomes Rubbo Pacheco on 14/03/23.
//

import ComposableArchitecture
import XCTest

@testable import TCA_Demo

@MainActor
final class AddToCardReducerTests: XCTestCase {
    
    func testInit() {
        let store = TestStore(
            initialState: AddToCartDomain.State(),
            reducer: AddToCartDomain.Reducer()
        )
        
        XCTAssertEqual(store.state.count, 0)
    }

    func testDidTapPlusButton() async {
        let store = TestStore(
            initialState: AddToCartDomain.State(),
            reducer: AddToCartDomain.Reducer()
        )

        await store.send(.didTapPlusButton) {
            $0.count = 1
        }
    }
    
    func testDidTapMinusButton() async {
        let store = TestStore(
            initialState: AddToCartDomain.State(),
            reducer: AddToCartDomain.Reducer()
        )
        
        await store.send(.didTapMinusButton) {
            $0.count = -1
        }
    }
    
}
