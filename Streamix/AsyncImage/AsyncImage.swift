//
//  AsyncImage.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import SwiftUI

struct AsyncImage<PlaceHolder: View> : View {
    @StateObject private var loader: ImageLoader
    private let placeHolder: PlaceHolder
    private let image: (UIImage) -> Image
    
    init(
        url: URL,
        @ViewBuilder placeHolder: () -> PlaceHolder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
         ) {
        self.placeHolder = placeHolder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url,
                                                        cache: Environment(\.imageCache).wrappedValue))
    }
                                
    var body: some View {
        content.onAppear(perform: loader.load)
    }
                              
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                    placeHolder
            }
        }
    }
}
                              
