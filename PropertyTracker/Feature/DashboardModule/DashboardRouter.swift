//
//  DashboardRouter.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 18/07/24.
//

import SwiftUI

enum DashboardRouter: NavigationRouter {
    case home
    case detail
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .home:
            .push
        case .detail:
            .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .home:
            HomeView()
        case .detail:
            DetailsView()
        }
    }
}
