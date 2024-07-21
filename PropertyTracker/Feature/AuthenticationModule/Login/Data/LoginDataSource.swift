//
//  LoginDataSource.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 18/07/24.
//

import Foundation

protocol LoginDataSourceProtocol {
    func signInWithGoogle() async -> Result<Void, Error>
}

struct LoginDataSource: LoginDataSourceProtocol {
    private let googleAuth: GoogleAuthProtocol
    
    init(googleAuth: GoogleAuthProtocol) {
        self.googleAuth = googleAuth
    }
    
    func signInWithGoogle() async -> Result<Void, Error> {
        do {
            try await googleAuth.signIn()
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
