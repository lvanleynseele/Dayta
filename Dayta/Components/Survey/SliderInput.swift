//
//  SliderInput.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/24/23.
//

import SwiftUI

struct SliderInput: View {
    var id: String = UUID().uuidString
    @Binding var input: Int
    var label: String

    var maximumRating = 7

    var offImage: Image?
    var onImage = Image(systemName: "circle.fill")

    var offColor = Color.gray
    var onColor = Color.green
    var body: some View {
        VStack() {
            if label.isEmpty == false {
                Text(label).padding()
            }

            HStack {
                ForEach(1..<maximumRating + 1, id: \.self) { number in
                    VStack{
                        image(for: number)
                            .foregroundColor(number == input ? onColor(for: number) : offColor)
                            .onTapGesture {
                                input = number
                            }
                        
                        Text("\(number)")
                            .foregroundColor(onColor(for: number))
                    }
                }
            }.scaledToFit()
        }
    }
    
    
    func image(for number: Int) -> Image {
        if number > input {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    func onColor(for number: Int) -> Color {
        let colorSeparator: Int = maximumRating/3
        
        if(number<=colorSeparator){
            return Color.red
        }
        if(number > colorSeparator*2+1){
            return Color.green
        }
        return Color.yellow
    }

}
