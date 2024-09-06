//
//  MealzViewConfig.swift
//  MealzOnboardingProviderSwiftUI
//
//  Created by Diarmuid McGonagle on 06/09/2024.
//

import Foundation
import MarmitonUIMealzIOS
import mealzcore
import MealziOSSDK


// TODO: 7. Import Custom Components

// TODO 7a. Create MealzViewConfig file
enum MealzViewConfig {
    // ----------------------------- RECIPE DETAILS ------------------------------
    
    // TODO 7b. Copy template
    static let recipeDetailsBaseViews = BasePageViewParameters()
    
    static let recipeDetailsViews = { (openMyBasket: @escaping () -> Void) -> RecipeDetailsViewOptions in
        RecipeDetailsViewOptions(
            header: TypeSafeRecipeDetailsHeader(MarmitonRecipeDetailsHeaderView(changeStore: changeStore)),
            selectedControl: TypeSafeRecipeDetailsSelectedControl(MarmitonRecipeDetailsSelectedControlView()),
            footer: TypeSafeRecipeDetailsFooter(MarmitonRecipeDetailsFooterView(openMyBasket: openMyBasket)),
            ingredientsAtHome: TypeSafeNotInBasketProduct(MarmitonNotInBasketProductView()),
            unavailableIngredients: TypeSafeNotInBasketProduct(MarmitonNotInBasketProductView())
        )
    }

    static let recipeDetailsProductsViews = RecipeDetailsProductViewOptions(
        ignoredProduct: TypeSafeRecipeDetailsIgnoredProduct(MarmitonRecipeDetailsIgnoredProductView()),
        addedProduct: TypeSafeRecipeDetailsAddedProduct(MarmitonRecipeDetailsAddedProductView())
    )
    
    static let itemSelectorView = ItemSelectorViewOptions(
        searchBar: TypeSafeSearch(MarmitonGeneralSearch())
    )
    
    static let recipeDetailsConfig = { (openMyBasket: @escaping () -> Void) -> RecipeDetailsFeatureConstructor in
        RecipeDetailsFeatureConstructor(
            baseViews: recipeDetailsBaseViews,
            recipeDetailsViewOptions: recipeDetailsViews(openMyBasket),
            recipeDetailsProductViewOptions: recipeDetailsProductsViews,
            itemSelectorViewOptions: itemSelectorView
        )
    }
    
    // ---------------------------------- MY MEALS ----------------------------------
    
    static let myMealsView = NestedMyMealsViewOptions(
        title: TypeSafeBaseTitle(EmptyTitleView()),
        recipeCard: TypeSafeMyMealRecipeCard(MarmitonMyMealRecipeCard())
    )
    
    static let myMealsBaseView = BasePageViewParameters(
        empty: TypeSafeEmpty(MarmitonMyMealsEmpty())
    )
    
    // -------------------------------- MY PRODUCTS ----------------------------------
    
    static let myProductsBaseView = BasePageViewParameters(
        empty: TypeSafeEmpty(MarmitonMyMealsEmpty())
    )
    
    static let myProductsView = MyProductsViewOptions(
        productCard: TypeSafeMyProductsProductCard(MarmitonMyProductsProductCard())
    )
    
    // ---------------------------------- MY BASKET ----------------------------------
    
    static let myBasketView = MyBasketViewOptions(
        title: TypeSafeBaseTitle(MarmitonMyBasketTitle(changeStore: changeStore)),
        swapper: TypeSafeMyBasketSwapper(MarmitonMyBasketSwapper(onAddAnotherProduct: {}))
    )
    
    static let myBasketConfig = MyBasketFeatureConstructor(
        myBasketViewOptions: myBasketView,
        myMealsViewOptions: MyMealsViewOptions(nestedOptions: myMealsView),
        myMealsBaseViews: myMealsBaseView,
        myProductsViewOptions: myProductsView,
        myProductsBaseViews: myProductsBaseView,
        defaultTab: .products,
        navigateToCatalog: {},
        navigateToCheckout: {_ in }
    )
    
    // ---------------------------------- GET PRICE BUTTON ----------------------------------
        
    // TODO 8a. Add Price Button view parameters to MealzViewConfig
    static let getPriceView = GetPriceButtonViewOptions(
        priceSuccess: TypeSafePriceSuccess(MarmitonGetPriceSuccessView()),
        buttonToGetPrice: TypeSafeEmpty(MarmitonGetPriceButtonView()),
        priceNotAvailable: TypeSafeEmpty(MarmitonPriceNotAvailableView())
    )
    
    static let getPriceParams = GetPriceButtonParameters(viewOptions: getPriceView)
}
