//
//  EnvironmentsValues+ImageCache.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TempImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
