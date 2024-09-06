//
//  MealzManager.swift
//  MealzOnboardingSupplierSwiftUI
//
//  Created by miam x didi on 24/07/2024.
//

// TODO: 7. Import Custom Components
// TODO 7a. Create MealzViewConfig file
// TODO 7b. Copy template
// TODO 7c. Pass in Config to UI components
// TODO 7d. Marmiton -> Navigation Recipe Details to MyBasket

import Foundation
import mealzcore
// TODO 5a. import Marmiton library
import MarmitonUIMealzIOS
import UIKit

// TODO 2a. Create MealzManager Class
public class MealzManager {
    // Will contain calls to Miam SDK core class for modules (User, Basket, Store...)
    
    public static let sharedInstance = MealzManager()
    
    // TODO: 3. Set SupplierKey, Store & User Id
    
    // TODO 3a. Copy & paste supplierID into variable
    let providerKey = "ewogICAgICAgICJwcm92aWRlcl9pZCI6ICJtYXJtaXRvbiIKCSJwbGF1c2libGVfZG9tYWluZSI6ICJtaWFtLm1hcm1pdG9uLmFwcCIsCgkibWlhbV9vcmlnaW4iOiAibWFybWl0b24iLAoJIm9yaWdpbiI6ICJtaWFtLm1hcm1pdG9uLmFwcCIsCgkibWlhbV9lbnZpcm9ubWVudCI6ICJVQVQiCn0="
    
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
        // 5c. update MealzManager
        Mealz.shared.user.setStoreLocatorRedirection {
            print("test")
            changeStore()
        }
    }
    
    // TODO: 5. Set chooseStoreRedirct
    
    // TODO 3d. Create function to set the user
    func updateUserId(userId: String?) {
        Mealz.shared.user.updateUserId(userId: userId, authorization: Authorization.userId)
    }
}

// TODO 5b. use Mealz webview
let changeStore: () -> Void = {
    let htmlFileURL =  MarmitonUIMealzIOS.bundle.url(forResource: "index", withExtension: "html", subdirectory: "Ressources")!
    
    var mealsWebView =  MealzStoreLocatorWebView(url:htmlFileURL) { value in
        guard let posId = value as? String else { return }
    }
    if let sceneDelegate = UIApplication.shared.connectedScenes
        .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
       let keyWindow = sceneDelegate.windows.first(where: { $0.isKeyWindow }),
       let rootViewController = keyWindow.rootViewController {
        
        // Find the topmost view controller which is not presenting another view controller
        var topViewController = rootViewController
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        
        // Present the new view controller from the topmost view controller
        topViewController.present(mealsWebView, animated: true)
    }
}
