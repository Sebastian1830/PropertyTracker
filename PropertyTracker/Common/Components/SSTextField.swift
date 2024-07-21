//
//  SSTextField.swift
//  PropertyTracker
//
//  Created by Sebastian Soto Varas on 8/07/24.
//

import SwiftUI

struct SSTextField: View {
    @Binding var value: String
    @State var placeholder: String
    @State var title = ""
    @State var error = ""
    @State var iconRight = ""
    @State var iconLeft = ""
    @State var effectOnBoth = false
    @State var type: TextFieldType = .input
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !title.isEmpty {
                Text(title)
                    .font(.callout)
            }
            HStack {
                if !iconLeft.isEmpty {
                    Image(systemName: iconLeft)
                        .symbolRenderingMode(isFocused ? .palette: .monochrome)
                        .foregroundStyle(.black, .blue)
                        .font(.system(size: 25, weight: .light))
                }
                switch type {
                case .input:
                    TextField(
                        "",
                        text: $value,
                        prompt: Text(placeholder)
                            .foregroundColor(Color("tfPlaceholder"))
                    )
                    .focused($isFocused)
                case .password:
                    SecureField(
                        "",
                        text: $value,
                        prompt: Text(placeholder)
                            .foregroundColor(Color("tfPlaceholder"))
                    )
                    .focused($isFocused)
                }
                if !iconRight.isEmpty {
                    Image(systemName: iconRight)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .blue)
                        .font(.system(size: 25, weight: .medium))
                }
            }
            .modifier(OvalTextFieldStyle())
            if !error.isEmpty {
                Text(error)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
        }
    }
}

struct OvalTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.vertical, 10)
            .foregroundColor(.textColor)
            .background(Color.background)
            .cornerRadius(6)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
    }
}

extension Color {
    static let lightShadow = Color.white.opacity(0.6)
    static let darkShadow = Color.gray.opacity(0.5)
    static let background = Color("tfBackground")
    static let textColor = Color("tfTextColor")
}

enum TextFieldType {
    case input
    case password
}

#Preview(traits: .sizeThatFitsLayout) {
    SSTextField(value: .constant(""), placeholder: "Usuario", iconLeft: "person.circle")
}
