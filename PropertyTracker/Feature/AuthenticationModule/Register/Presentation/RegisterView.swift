//
//  RegisterView.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 9/07/24.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            Color("ptBackgroundColor")
                .ignoresSafeArea()
            VStack {
                VStack {
                    VStack(spacing: 15) {
                        Text("Registrate")
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
                    Text("ó")
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                    HStack(spacing: 40) {
                        Button(
                            action: {
                                print("facebook")
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
                    .padding(.top, 5)
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.background)
                        .padding()
                    Button(
                        action: {
                            print("Go")
                        },
                        label: {
                            Text("Registrar")
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                    )
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 25)
            }
        }
    }
}

#Preview {
    RegisterView()
}
