//
//  MealzOnboardingProviderSwiftUIApp.swift
//  MealzOnboardingProviderSwiftUIApp
//
//  Created by miam x didi on 24/07/2024.
//

import SwiftUI

// TODO: 1. Import Mealz Repositories
 import mealzcore
 import MealziOSSDK


// TODO: 2. Create MealzManager file

// TODO 2b. Create AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // init Mealz
        let _ = MealzManager.sharedInstance
        return true
    }
}

@main
struct MealzOnboardingProviderSwiftUIApp: App {
    // TODO 2c. Add AppDelegate to SwiftUI App
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
