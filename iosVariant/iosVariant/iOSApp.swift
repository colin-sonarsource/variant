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

import Foundation
import KMPObservableViewModelSwiftUI
import SwiftUI
import Variant

private let TAG = "IOSApp"

@main
struct iOSApp: App {
    var variantViewModel: VariantViewModel

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentViewModel(variantViewModel)
        }
    }

    init() {
        Koin.start()

        variantViewModel = Koin.instance.get()

        guard
            let rootDirectory = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first
        else {
            Log().error(
                tag: TAG,
                message: "Failed to get document directory URL"
            )
            fatalError()
        }
        do {
            let libraryDirectory = rootDirectory.appendingPathComponent("Variant")
            try FileManager.default.createDirectory(
                at: libraryDirectory,
                withIntermediateDirectories: true,
                attributes: nil
            )
            variantViewModel.setLibraryDirectory(directory: libraryDirectory.path)
        } catch {
            Log().error(tag: TAG, message: error.localizedDescription)
            fatalError(error.localizedDescription)
        }
    }
}
