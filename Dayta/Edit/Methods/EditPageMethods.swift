//
//  PageMethods.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/19/23.
//

import Foundation




func addPage(pageLabel: String, pagePrompt: String) {
    
    let newPage = SurveyPageViewModel(id: UUID().uuidString, pageLabel: pageLabel, pagePrompt: pagePrompt)
    //commit new page to db
    
    //return newPage
    
}

func addMainAttribute(pageId: String, slider: SliderViewModel? = nil, toggle: LabeledToggleViewModel? = nil) {
    //perform lookup to find page and initialize page: SurveyPageVM
    
    
    
}

func addMoreAttribute(pageId: String, toggle: LabeledToggleViewModel){
    //find page
    
    //check if more prompts exists
    //create or append new labelled toggle

}

func editPage(
    pageId: String, pageLabel: String? = nil, pagePrompt: String? = nil) {
    //find page
    
    //edit page
    
    //commit to db
    
}
    

func editAttribute(pageId: String, attributeId: String, slider: SliderViewModel? = nil, toggle: LabeledToggleViewModel? = nil) {
    //find page
    
    //find attribute, check both main and more prompts
    
    //edit attribute
    
    //commit to db
    
}

func deletePage(pageId: String) {
    
}

func deleteAttribute(attributeId: String) {
    
}
