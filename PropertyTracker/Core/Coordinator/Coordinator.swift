//
//  Coordinator.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 9/07/24.
//

import SwiftUI

class Coordinator<Router: NavigationRouter>: ObservableObject {
    let navigationController: UINavigationController
    private let startingRouter: Router?
    
    init(navigationController: UINavigationController = .init(), startingRouter: Router? = nil) {
        self.navigationController = navigationController
        self.startingRouter = startingRouter
    }
    
    func start() {
        guard let route = startingRouter else { return }
        show(route)
    }
    
    func navigateTo(module: ModulesNavigator) {
        let appCoordinator = AppCoordinator(module, navigationController)
        appCoordinator.buildModule()
    }
    
    func show(_ route: Router, animated: Bool = true) {
        let view = route.view()
        let viewWithCoordinator = view.environmentObject(self)
        let viewController = UIHostingController(rootView: viewWithCoordinator)
        switch route.transition {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .presentModally:
            viewController.modalPresentationStyle = .formSheet
            navigationController.present(viewController, animated: animated)
        case .presentFullscreen:
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(viewController, animated: animated)
        }
    }
    
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: true) { [weak self] in
            /// because there is a leak in UIHostingControllers that prevents from deallocation
            self?.navigationController.viewControllers = []
        }
    }
}
