//
//  LoginRepository.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 20/07/24.
//

import Foundation

struct LoginRepository: LoginRepositoryProtocol {
    private let datasource: LoginDataSourceProtocol
    
    init(datasource: LoginDataSource) {
        self.datasource = datasource
    }
    
    func signInWithGoogle() async -> Result<Void, Error> {
        await datasource.signInWithGoogle()
    }
    
}
