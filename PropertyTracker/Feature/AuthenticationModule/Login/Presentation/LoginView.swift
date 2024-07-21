//
//  LoginView.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 8/07/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct LoginView: View {
    @EnvironmentObject var coordinator: Coordinator<AuthenticationRouter>
    @ObservedObject private var viewModel: LoginViewModel
    
    @State var email = ""
    @State var password = ""
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color("ptBackgroundColor")
                .ignoresSafeArea()
            VStack {
                VStack {
                    VStack(spacing: 15) {
                        Text("Property Tracker")
                            .font(.title)
                            .foregroundColor(Color("lgTitleColor"))
                            .bold()
                        SSTextField(
                            value: $email,
                            placeholder: "Correo",
                            iconLeft: "person.circle"
                        )
                        SSTextField(
                            value: $password,
                            placeholder: "Contraseña",
                            iconLeft: "lock.circle.dotted",
                            type: .password
                        )
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 25)
                    .background(Color.background)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    HStack(spacing: 40) {
                        HStack(spacing: 40) {
                            Button(
                                action: {
                                    viewModel.signInWithGoogle()
                                },
                                label: {
                                    Image("facebookLogo")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                }
                            )
                            Button(
                                action: {
                                    print("google")
                                },
                                label: {
                                    Image("googleLogo")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                }
                            )
                        }
                    }
                    .padding(.top, 20)
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.background)
                        .padding()
                    Button(
                        action: {
                            coordinator.navigateTo(module: .dashboard)
                        },
                        label: {
                            Text("Iniciar Sesion")
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                    )
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 25)
            }
            .safeAreaInset(edge: .bottom) {
                Button(
                    action: {
                        coordinator.show(.register)
                    },
                    label: {
                        Text("Registrar")
                            .bold()
                            .foregroundStyle(Color.white)
                    }
                )
            }
            if viewModel.isLoading {
                Color("BgLoader")
                    .ignoresSafeArea()
                ProgressView()
                    .tint(.white)
            }
        }
        .onChange(of: viewModel.loginSuccess) { _, newValue in
            if newValue {
                coordinator.navigateTo(module: .dashboard)
            }
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(googleSignIn: LoginUseCasePreview()))
}
