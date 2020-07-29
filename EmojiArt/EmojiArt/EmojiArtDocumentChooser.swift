//
//  EmojiArtDocumentChooser.swift
//  EmojiArt
//
//  Created by Louis Ye on 7/29/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentChooser: View {
    @EnvironmentObject var store: EmojiArtDocumentStore
    var body: some View {
        NavigationView{
            List{
                ForEach(store.documents) {document in
                    NavigationLink(destination: EmojiArtDocumentView(document: document)
                        .navigationBarTitle(self.store.name(for: document))
                    ) {
                        Text(self.store.name(for: document))
                    }
                }
            }
            .navigationBarTitle(self.store.name)
        .navigationBarItems(leading: Button(action: {
            self.store.addDocument()
        }, label: {
            Image(systemName: "plus").imageScale(.large)
        }))
        }
    }
}

struct EmojiArtDocumentChooser_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentChooser()
    }
}
