//
//  MealzManager.swift
//  MealzOnboardingSupplierSwiftUI
//
//  Created by miam x didi on 24/07/2024.
//

import Foundation
import mealzcore

// TODO 2a. Create MealzManager Class
public class MealzManager {
    // Will contain calls to Miam SDK core class for modules (User, Basket, Store...)
    
    public static let sharedInstance = MealzManager()
    
    // TODO: 3. Set SupplierKey, Store & User Id
    
    // TODO 3a. Copy & paste supplierID into variable
    let providerKey = "ewoJInByb3ZpZGVyX2lkIjogIjE0IiwKCSJwbGF1c2libGVfZG9tYWluZSI6ICJtaWFtLnRlc3QiLAoJIm1pYW1fb3JpZ2luIjogIm1pYW0iLAoJIm9yaWdpbiI6ICJtaWFtIiwKCSJtaWFtX2Vudmlyb25tZW50IjogIlVBVCIKfQ"
    
    // TODO 3b. Init Mealz
    private init() {
        Mealz.shared.Core(init: { coreBuilder in
            // set supplier key
            coreBuilder.sdkRequirement(init: { [self] requirementBuilder in
                requirementBuilder.key = providerKey
            })
            // TODO 3c. Allow authless users
            coreBuilder.option(init: { config in
                config.isAnonymousModeEnabled = true
            })
        })
    }
    
    // TODO: 5. Set chooseStoreRedirct
    // TODO 5a. import Marmiton library
    // TODO 5b. use Mealz webview
    // TODO 5c. update MealzManager
    
    // TODO 3d. Create function to set the user
    func updateUserId(userId: String?) {
        Mealz.shared.user.updateUserId(userId: userId, authorization: Authorization.userId)
    }
}
