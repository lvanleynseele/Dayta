//
//  EditSurveyPageView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/19/23.
//

import SwiftUI

struct EditSurveyPageView: View {
    var model: SurveyPageViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Section {
                    Text(model.pageLabel)
                        .foregroundColor(Color.blue)
                        .font(.title2)
                        .padding()
                }.frame(maxWidth: .infinity, maxHeight: 50, alignment: .top)
                Divider()
                
                Section{
                    VStack(alignment: .center){
                        Section {
                            if (model.mainSlider != nil){
                                EditSliderView(model: model.mainSlider!, pageId: model.id)
                            }
                            else{
                                if (model.mainToggle != nil){
                                    EditToggleView(model: model.mainToggle!, pageId: model.id)
                                }
                                else{
                                    //add main aatribute code
                                    Button("Add main attribute"){
                                        //addSliderAttribute(slider: <#T##SliderViewModel#>, date: <#T##Date#>, dayScore: <#T##Int#>)
                                    }
                                }
                            }
                            
                        }
                        .padding([.bottom], 50)
                        Divider()
                        
                        if(model.morePrompts != nil) {
                            Section {
                                
                                
                                HStack {
                                    Text("More prompts section")
                                    Spacer()
                                    Image(systemName:"chevron.down")
                                }                                
                                ForEach(model.morePrompts!.morePrompts) { prompt in
                                    EditToggleView(model: prompt, pageId: model.id)
                                }
                                
                            }.frame(maxWidth: 300)
                                .padding([.vertical], 20)
                        }
                    }
                }
            }
            
            
            
            
        
            
        }
    }
}

struct EditSurveyPageView_Previews: PreviewProvider {
    static var previews: some View {
        EditSurveyPageView(model: surveyPageExampleSlider)
    }
}
