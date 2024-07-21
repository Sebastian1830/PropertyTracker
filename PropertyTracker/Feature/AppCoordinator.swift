//
//  AppCoordinator.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 18/07/24.
//

import SwiftUI

enum ModulesNavigator {
    case dashboard
}

struct AppCoordinator {
    private let module: ModulesNavigator
    private let navigationController: UINavigationController
    
    init(_ module: ModulesNavigator, _ navigationController: UINavigationController) {
        self.module = module
        self.navigationController = navigationController
    }
    
    func buildModule() {
        switch module {
        case .dashboard:
            let coordinator: Coordinator<DashboardRouter> = .init(navigationController: navigationController, startingRouter: .home)
            coordinator.start()
        }
    }
}
