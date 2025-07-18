/*
 * Variant - A digital comic book reading application for the iPad and Android tablets.
 * Copyright (C) 2025, The ComiXed Project
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses>
 */

import KMPObservableViewModelSwiftUI
import SwiftUI
import Variant

struct ComicBookListView: View {
    @State var selected: ComicBook?

    let comicBookList: [ComicBook]

    var body: some View {
        NavigationStack {
            List(comicBookList, id: \.path, selection: $selected) { comicBook in
                ComicBookListItemView(
                    comicBook: comicBook,
                    onComicBookClicked: { _ in }
                )
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {

                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                    .tint(.red)
                }
                .swipeActions(edge: .trailing) {
                    Button {

                    } label: {
                        Label("Open", systemImage: "play.fill")
                    }
                    .tint(.green)
                }
            }
            .navigationTitle("Comic List")
        }
    }
}

#Preview {
    ComicBookListView(
        comicBookList: COMIC_BOOK_LIST
    )
}
