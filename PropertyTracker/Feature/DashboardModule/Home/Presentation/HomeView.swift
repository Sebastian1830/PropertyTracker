//
//  HomeView.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 18/07/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator<DashboardRouter>
    
    var body: some View {
        Text("HOME")
        Button(
            action: {
                coordinator.show(.detail)
            },
            label: {
                Text("Ir a Detalles")
                    .bold()
                    .foregroundStyle(Color.black)
            }
        )
    }
}

#Preview {
    HomeView()
}
