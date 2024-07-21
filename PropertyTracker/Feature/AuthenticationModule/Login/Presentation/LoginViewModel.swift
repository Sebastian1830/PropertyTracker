//
//  LoginViewModel.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 21/07/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let googleSignIn: GoogleSignInUseCaseProtocol
    
    @Published var loginSuccess = false
    @Published var isLoading = false
    
    init(googleSignIn: GoogleSignInUseCaseProtocol) {
        self.googleSignIn = googleSignIn
    }
    
    func signInWithGoogle() {
        isLoading = true
        Task {
            let result = await googleSignIn.execute()
            
            guard case .success = result else {
                Task { @MainActor in
                    isLoading = false
                }
                return
            }

            Task { @MainActor in
                isLoading = false
                loginSuccess = true
            }
        }
    }
    
}
