//
//  LoginPreview.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 21/07/24.
//

import Foundation

struct LoginUseCasePreview: GoogleSignInUseCaseProtocol {
    var response = true
    
    func execute() async -> Result<Void, Error> {
        response ? .success(()) : .failure((any Error).self as! Error)
    }
}
