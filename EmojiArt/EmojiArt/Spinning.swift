//
//  Spinning.swift
//  EmojiArt
//
//  Created by Louis Ye on 7/23/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct Spinning: ViewModifier {
    @State var isVisable = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isVisable ? 360: 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear {self.isVisable = true}
    }
}

extension View {
    func spinning() -> some View {
        self.modifier(Spinning())
    }
}
