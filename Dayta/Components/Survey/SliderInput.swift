//
//  SliderInput.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/24/23.
//

import SwiftUI

struct SliderInput: View {
    
    @ObservedObject var model: SliderViewModel
    @State var input: Int = 4

    var body: some View {
        VStack() {
            if model.label.isEmpty == false {
                Text(model.label).padding()
            }
            
            
            HStack {
                ForEach(1..<model.maximumRating + 1, id: \.self) { number in
                    VStack{
                        image(for: number)
                            .foregroundColor(number == input ? onColor(for: number) : model.offColor)
                            .onTapGesture {
                                input = number
                                model.inputState = input
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
            return model.offImage ?? model.onImage
        } else {
            return model.onImage
        }
    }
    
    func onColor(for number: Int) -> Color {
        let colorSeparator: Int = model.maximumRating/3
        
        if(number<=colorSeparator){
            return Color.red
        }
        if(number > colorSeparator*2+1){
            return Color.green
        }
        return Color.yellow
    }

}
