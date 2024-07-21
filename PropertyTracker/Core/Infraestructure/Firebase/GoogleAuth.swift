//
//  GoogleAuth.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 18/07/24.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

protocol GoogleAuthProtocol {
    func signIn() async throws
    func logout() async throws
}

struct GoogleAuth: GoogleAuthProtocol {
    
    private let firebaseApp: FirebaseApp?
    private let googleSignIn: GIDSignIn
    
    init(firebaseApp: FirebaseApp?, googleSignIn: GIDSignIn) {
        self.firebaseApp = firebaseApp
        self.googleSignIn = googleSignIn
    }
    
    func signIn() async throws {
        guard let clientID = firebaseApp?.options.clientID else { fatalError("no firebase clientID found") }
        let config = GIDConfiguration(clientID: clientID)
        googleSignIn.configuration = config
        
        let scene = await UIApplication.shared.connectedScenes.first as? UIWindowScene
        guard let rootViewController = await scene?.windows.first?.rootViewController else { fatalError("There is no root view controller!") }
        
        let result = try await googleSignIn.signIn(withPresenting: rootViewController)
        
        let user = result.user
        guard let idToken = user.idToken?.tokenString else { fatalError("Unexpected error occurred, please retry") }
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken, accessToken: user.accessToken.tokenString
        )
        try await Auth.auth().signIn(with: credential)
    }
    
    func logout() async throws {
        GIDSignIn.sharedInstance.signOut()
        try Auth.auth().signOut()
    }
    
}
