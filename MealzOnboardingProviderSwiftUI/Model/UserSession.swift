//
//  UserSession.swift
//  MealzOnboardingSwiftUI
//
//  Created by Diarmuid McGonagle on 25/06/2024.
//

import Foundation

class UserSession: ObservableObject {
    @Published var user: PretendUser?
    
    let userRepository = PretendUserRepository()
    
    init() {
        if let user = userRepository.getStoredUser() { setUser(user: user) }
    }
    
    func disconnectUser() {
        user = nil
        userRepository.deleteStoredUser()
        // TODO 3f. Call Mealz Function
    }
    
    func setUser(user: PretendUser) {
        // TODO 3e. Call Mealz Function
        self.user = user
    }
}
