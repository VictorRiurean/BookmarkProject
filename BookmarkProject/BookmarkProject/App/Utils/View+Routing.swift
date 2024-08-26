//
//  View+Routing.swift
//  BookmarkProject
//
//  Created by Victor on 26/08/2024.
//

import DesignSystems
import Environment
import Models
import SwiftData
import SwiftUI


@MainActor
extension View {
    func withAppRouter() -> some View {
        navigationDestination(for: RouterDestination.self) { destination in
            switch destination {
            case .assetDetails(let url):
                Text(url)
            case .themePreview:
                ThemePreviewView()
                    .withEnvironments()
            }
        }
    }
    
    func withSheetDestinations(sheetDestinations: Binding<SheetDestination?>) -> some View {
        sheet(item: sheetDestinations) { destination in
            switch destination {
            case .fontPicker:
                FontPicker()
            }
        }
    }
    
    func withEnvironments() -> some View {
        environment(UserPreferences.shared)
            .environment(Theme.shared)
    }
}
