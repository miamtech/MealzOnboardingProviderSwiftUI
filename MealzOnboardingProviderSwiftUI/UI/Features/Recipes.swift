//
//  Recipes.swift
//  MealzOnboardingProviderSwiftUIApp
//
//  Created by miam x didi on 24/07/2024.
//

import SwiftUI

struct Recipes: View {
    var body: some View {
        VStack {
            DummyRecipeCard(
                imageUrl: "https://hips.hearstapps.com/hmg-prod/images/delish-202102-airfryerchickenparm-184-ls-1612561654.jpg?crop=1xw:0.84375xh;center,top&resize=1200:*",
                title: "Chicken Parm",
                recipeId: "22509",
                fetchPrice: { return 0.0 })
            DummyRecipeCard(
                imageUrl: "https://assets.afcdn.com/recipe/20170112/28965_w1024h768c1cx1500cy1000.webp",
                title: "Croque Monsieur",
                recipeId: "14472",
                fetchPrice: { return 0.0 })
        }
        .padding()
    }
    
    struct DummyRecipeCard: View {
        let imageUrl: String
        let title: String
        let recipeId: String
        @State var getPriceText: String = "See Price"
        let fetchPrice: () -> Double
        
        @State private var showRecipeDetails: Bool = false
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
                    Button(action: { fetchPrice() }, label: {
                        Text(getPriceText)
                    })
                    Spacer()
                    Button(action: { showRecipeDetails.toggle() }, label: {
                        Text("Open Card")
                    })
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .sheet(isPresented: $showRecipeDetails, content: {
                Text("RecipeId")
            })
        }
    }
}

#Preview {
    Recipes()
}
