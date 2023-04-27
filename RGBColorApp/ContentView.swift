//
//  ContentView.swift
//  RGBColorApp
//
//  Created by Elizabeth on 25/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255).rounded()
    @State private var greenSliderValue = Double.random(in: 0...255).rounded()
    @State private var blueSliderValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var focusedField: Field?

    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
            VStack(spacing: 50) {
                ColorView(
                    red: redSliderValue,
                    green: greenSliderValue,
                    blue: blueSliderValue
                )
                VStack(spacing: 40) {
                    ColorSliderView(value: $redSliderValue, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $greenSliderValue, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blueSliderValue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private enum Field {
        case red
        case green
        case blue
    }
    func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}

