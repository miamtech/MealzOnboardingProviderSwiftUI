//
//  ContentView.swift
//  MealzOnboardingProviderSwiftUIApp
//
//  Created by miam x didi on 24/07/2024.
//

import SwiftUI

struct ContentView: View {
    @SwiftUI.State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Recipes(selectedTab: $selectedTab)
                .tabItem { Label("Home", systemImage: "house") }
                .tag(0)
            Basket()
                .tabItem { Label("Basket", systemImage: "basket") }
                .tag(1)
        }
    }
}

#Preview {
    ContentView()
}
