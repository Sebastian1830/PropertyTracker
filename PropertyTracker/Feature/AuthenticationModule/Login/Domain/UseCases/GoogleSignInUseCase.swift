//
//  GoogleSignInUseCase.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 18/07/24.
//

import Foundation

// TODO: Facebook sign in
// TODO: Google sign in
// TODO: Password and email sign in

protocol GoogleSignInUseCaseProtocol {
    func execute() async -> Result<Void, Error>
}

struct GoogleSignInUseCase: GoogleSignInUseCaseProtocol {
    private let repository: LoginRepositoryProtocol
    
    init(repository: LoginRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<Void, Error> {
        await repository.signInWithGoogle()
    }
}
