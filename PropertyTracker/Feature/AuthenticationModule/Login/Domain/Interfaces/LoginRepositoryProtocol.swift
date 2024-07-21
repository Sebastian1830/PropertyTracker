//
//  LoginRepositoryProtocol.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 20/07/24.
//

import Foundation

protocol LoginRepositoryProtocol {
    func signInWithGoogle() async -> Result<Void, Error>
}
