//
//  Basket.swift
//  MealzOnboardingProviderSwiftUIApp
//
//  Created by miam x didi on 24/07/2024.
//

import SwiftUI
// TODO 6a. Import MealziOSSDK
import MealziOSSDK

// TODO: 6. Show MyBasket

struct Basket: View {
    var body: some View {
        // TODO 6b. Add MyBasket component
        // TODO 7c. Pass in Config to UI components
        MealzMyBasketFeatureSwiftUI(myBasketContructor: MealzViewConfig.myBasketConfig)
    }
}
