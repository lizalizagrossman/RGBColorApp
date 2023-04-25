//
//  ContentView.swift
//  RGBColorApp
//
//  Created by Elizabeth on 25/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 0.0
    @State private var greenSliderValue = 0.0
    @State private var blueSliderValue = 0.0

    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
                .onTapGesture {
                    self.endEditing()
                }
            VStack(spacing: 30) {
                ColorView(redValue: redSliderValue, greenValue: greenSliderValue, blueValue: blueSliderValue)
                ColorSettings(color: .red, sliderValue: $redSliderValue)
                ColorSettings(color: .green, sliderValue: $greenSliderValue)
                ColorSettings(color: .blue, sliderValue: $blueSliderValue)
                
                Spacer()
            }
            .padding()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    endEditing()
                }
            }
        }
        
    }
    
    private func endEditing() {
            UIApplication.shared.endEditing()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSettings: View {
    let color: Color
    @Binding var sliderValue: Double
    @State var textFieldText = ""
    @State private var alertPresented = false
    
    
    
    var body: some View {
        HStack(spacing: 20) {
            Text("\(lround(sliderValue))")
                .foregroundColor(.white)
            Slider(
                value: $sliderValue,
                in: 0...250,
                step: 1,
                onEditingChanged: { _ in
                    textFieldText = "\(sliderValue)"
                }
            )
                .tint(color)
            
            TextField(
                "\(lround(sliderValue))",
                text: $textFieldText,
                onEditingChanged: { _ in
                    checkValue()
                }
            )
            .textFieldStyle()
        }
        
    }
    
    func checkValue() {
        let numberTextField = Double(textFieldText) ?? sliderValue
        sliderValue = numberTextField
        if numberTextField < 1 {
            sliderValue = 1
        } else if numberTextField > 255 {
            sliderValue = 255
        }
    }
    
}

struct TextFieldViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
            .padding(EdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3))
            .frame(width: 70, height: 30)
            
    }
}

extension TextField {
    func textFieldStyle() -> some View {
        modifier(TextFieldViewModifier())
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
