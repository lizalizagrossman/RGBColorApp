//
//  ColorView.swift
//  RGBColorApp
//
//  Created by Elizabeth on 25/04/2023.
//

import SwiftUI

struct ColorView: View {
    var red: Double
    var green: Double
    var blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .cornerRadius(20)
            .frame(height: 130)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}
                  
struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 250, green: 200, blue: 100)
    }
}
