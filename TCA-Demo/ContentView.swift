//
//  ContentView.swift
//  TCA-Demo
//
//  Created by Pedro Gomes Rubbo Pacheco on 08/03/23.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    var body: some View {
        ProductListView(
            store: Store(
                initialState: ProductListDomain.State(),
                reducer: ProductListDomain.Reducer(fetchProducts: { Product.sample })
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
