//
//  NavigationRouter.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 9/07/24.
//

import SwiftUI

protocol NavigationRouter {
    associatedtype V: View
    var transition: NavigationTransitionStyle { get }
    
    @ViewBuilder
    func view() -> V
}
