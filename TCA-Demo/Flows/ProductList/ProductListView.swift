//
//  ProductListView.swift
//  TCA-Demo
//
//  Created by Pedro Gomes Rubbo Pacheco on 12/03/23.
//

import ComposableArchitecture
import SwiftUI

struct ProductListView: View {
    let store: Store<ProductListDomain.State, ProductListDomain.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            List {
                ForEachStore(
                    self.store.scope(
                        state: \.products,
                        action: ProductListDomain.Action.row
                    )
                ) { store in
                    ProductCell(store: store)
                }
            }
            .task {
                viewStore.send(.fetchProducts)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(
            store: Store(
                initialState: ProductListDomain.State(),
                reducer: ProductListDomain.Reducer(fetchProducts: { Product.sample })
            )
        )
    }
}
