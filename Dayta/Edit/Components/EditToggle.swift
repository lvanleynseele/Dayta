//
//  SwiftUIView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/23/23.
//

import SwiftUI

struct EditToggleView: View {
    
    var model: LabeledToggleViewModel
    var pageId: String
    
    @State var editToggleOpen: Bool = false
//    @State var editToggleOpen: Bool = false
    @State var label: String = ""
    @FocusState var labelIsFocused: Bool
    
    @State var prompt: String = ""
    @FocusState var promptIsFocused: Bool
    
    
    var body: some View {
        if(!editToggleOpen) {
            HStack(){
                LabeledToggle(model: model)
                    .frame(maxWidth: 275, alignment: .center )
                
                Button("Edit") {
                    editToggleOpen = true
                }.frame(width: 40, height: 20, alignment: .center)
            }
                    
        }
        
        else{
            Section{
                VStack{
                    Button("Done") {
                        editAttribute(pageId: pageId, attributeId: model.id)
                        editToggleOpen = false
                    }
                    .frame(maxWidth: 300, alignment: .trailing)
                    Text("Label")
                    TextField("Label", text: $label, prompt: Text("Enter a label for this slider"))
                        .multilineTextAlignment(.center)
                        .focused($labelIsFocused)
                        .border(.black)
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

                }
            }
        }
    }
}

struct EditToggleView_Previews: PreviewProvider {
    static var previews: some View {
        EditToggleView(model: surveyPageExampleToggle.mainToggle!, pageId: UUID().uuidString)
    }
}
