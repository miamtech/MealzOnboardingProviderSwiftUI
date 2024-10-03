//
//  Recipes.swift
//  MealzOnboardingProviderSwiftUIApp
//
//  Created by miam x didi on 24/07/2024.
//

import SwiftUI
// TODO 4a. import MealziOSSDK
import MealziOSSDK

// TODO: 4. Add Mealz Recipe Details

// TODO 8. Get Price Button
// TODO 8a. Add Price Button view parameters to MealzViewConfig
// TODO 8b. Call GetPriceButton component

struct Recipes: View {
    @Binding var selectedTab: Int
    var body: some View {
        VStack {
            DummyRecipeCard(
                selectedTab: $selectedTab,
                imageUrl: "https://hips.hearstapps.com/hmg-prod/images/delish-202102-airfryerchickenparm-184-ls-1612561654.jpg?crop=1xw:0.84375xh;center,top&resize=1200:*",
                title: "Chicken Parm",
                recipeId: "22509"
            )
            DummyRecipeCard(
                selectedTab: $selectedTab,
                imageUrl: "https://assets.afcdn.com/recipe/20170112/28965_w1024h768c1cx1500cy1000.webp",
                title: "Croque Monsieur",
                recipeId: "14472"
            )
        }
        .padding()
    }
    
    struct DummyRecipeCard: View {
        @Binding var selectedTab: Int
        let imageUrl: String
        let title: String
        let recipeId: String
        
        var body: some View {
            VStack {
                Text(title)
                    .bold()
                if let imageUrl = URL(string: imageUrl) {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        default:
                            Image(systemName: "exclamationmark.triangle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .frame(width: 200, height: 100)
                }
                HStack {
                    Text("Get price")
                    Spacer()
                    MealzShowRecipeDetailsButton(
                        recipeId: recipeId,
                        isMealzRecipe: false,
                        recipeDetailsConstructor: MealzViewConfig.recipeDetailsConfig({
                            // TODO 7d. Marmiton -> Navigation Recipe Details to MyBasket
                            selectedTab = 1
                        })
                    )
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
        }
    }
}
