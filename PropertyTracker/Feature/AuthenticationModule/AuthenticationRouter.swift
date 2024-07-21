//
//  AuthenticationRouter.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 11/07/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

enum AuthenticationRouter: NavigationRouter {
    case login
    case register
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .login:
            .push
        case .register:
            .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .login:
            let googleLib = GoogleAuth(firebaseApp: FirebaseApp.app(), googleSignIn: GIDSignIn.sharedInstance)
            let dataSource = LoginDataSource(googleAuth: googleLib)
            let repository = LoginRepository(datasource: dataSource)
            let useCase = GoogleSignInUseCase(repository: repository)
            let viewModel = LoginViewModel(googleSignIn: useCase)
            LoginView(viewModel: viewModel)
        case .register:
            RegisterView()
        }
    }
}
