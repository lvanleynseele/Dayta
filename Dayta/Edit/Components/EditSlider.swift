//
//  EditSlider.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/22/23.
//

import SwiftUI

struct EditSliderView: View {
    
    var model: SliderViewModel
    var pageId: String
    
    @State var editSliderOpen: Bool = false
    
    @State var label: String = ""
    @FocusState var labelIsFocused: Bool
    
    @State var prompt: String = ""
    @FocusState var promptIsFocused: Bool
    
    @State var maximumRating: Int = 5
    
    var body: some View {
            if(!editSliderOpen) {
                HStack(){
                    SliderInput(model: model)
                        .frame(maxWidth: 250, alignment: .center )
                    
                    Button("Edit") {
                        editSliderOpen = true
                    }.frame(width: 40, height: 20, alignment: .center)
                }
                        
            }
            
            else{
                Section{
                    VStack{
                        Button("Done") {
                            editAttribute(pageId: pageId, attributeId: model.id)
                            editSliderOpen = false
                        }
                        .frame(maxWidth: 300, alignment: .trailing)
                        Text("Label")
                        TextField("Label", text: $label, prompt: Text("Enter a label for this slider"))
                            .multilineTextAlignment(.center)
                            .focused($labelIsFocused)
//                            .border(.black)
                            .scaledToFit()
                            .frame(maxWidth: 300, maxHeight: 50)
//                            .onTapGesture {
//                                UIKeyboardType()
//                            }
                        
                        Text("Prompt")
                        TextField("Prompt", text: $prompt, prompt: Text("Enter a prompt for this slider"))
                            .multilineTextAlignment(.center)
                            .focused($promptIsFocused)
                            .border(.black)
                            .scaledToFit()
                            .frame(maxWidth: 300, maxHeight: 50)

                        Text("Rating scale, 1-n")
                        Picker("Maximum Rating", selection: $maximumRating) {
                            ForEach(3..<11) { rating in
                                Text("\(rating)")
                            }
                        }
                    }
                }
            }
    }
    
    
}



struct EditSliderView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let pageId = UUID().uuidString
        HStack{
            EditSliderView(model: surveyPageExampleSlider.mainSlider!, pageId: pageId)
        }
        
    }
}
