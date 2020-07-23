//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Louis Ye on 7/22/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View{
        Group{
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}

