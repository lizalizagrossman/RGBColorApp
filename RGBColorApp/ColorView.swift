//
//  ColorView.swift
//  RGBColorApp
//
//  Created by Elizabeth on 25/04/2023.
//

import SwiftUI

struct ColorView: View {
    var redValue: Double
    var greenValue: Double
    var blueValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255))
            .frame(width: 380, height: 200)
    }
}
                  
struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redValue: 250, greenValue: 200, blueValue: 100)
    }
}
