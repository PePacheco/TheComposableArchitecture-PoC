//
//  ProductCell.swift
//  TCA-Demo
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/03/23.
//

import ComposableArchitecture
import SwiftUI

struct ProductCell: View {
    let store: Store<ProductDomain.State, ProductDomain.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Image(viewStore.product.imageString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                
                VStack(alignment: .leading) {
                    Text(viewStore.product.title)
                    
                    HStack {
                        Text("$\(viewStore.product.price.description)")
                            .font(.custom("AmericanTypewriter", size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        AddToCartButton(
                            store: self.store.scope(
                                state: \.addToCartState,
                                action: ProductDomain.Action.addToCart
                            )
                        )
                    }
                }
            }
            .padding(20)
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(
            store: Store(
                initialState: ProductDomain.State(id: UUID(), product: Product.sample[0]),
                reducer: ProductDomain.Reducer()
            )
        )
    }
}
