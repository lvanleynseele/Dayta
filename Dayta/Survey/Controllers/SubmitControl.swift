//
//  SubmitControl.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/7/23.
//

import Foundation
import SwiftUI
import UIKit

struct SubmitControl: UIViewRepresentable {
    
    var pages: [SurveyPage]
    var dailySurveys: [DailySurveyViewModel]
    var surveyData: [SurveyPageAnalyticsViewModel]
//    var navController: UINavigationController
    
    @Binding var showSubmitAlert: Bool
    @Binding var surveySubmitted: Bool
    

    let button = UIButton()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIButton {
        button.setTitle("Submit", for: .normal) 
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(context.coordinator, action: #selector(Coordinator.submitSurvey(sender:)), for: .touchUpInside)

        return button
    }
    
    
    func updateUIView(_ uiView: UIButton, context: Context) {

    }
    
    class Coordinator: NSObject {
        var parent: SubmitControl
        
        init(_ submitButton: SubmitControl) {
            self.parent = submitButton
        }
        
        @objc
        func submitSurvey(sender: UIButton) throws {
            if(!canSubmit()){
                self.parent.showSubmitAlert = true
            }
            else{
                self.parent.button.isEnabled = false
                self.parent.button.setTitleColor(UIColor.gray, for: .disabled)
                
                try commitDailySurvey()

                self.parent.surveySubmitted = true
                
//                parent.navController.popToRootViewController(animated: true)
            }
        }
        
        func canSubmit() -> Bool {
            for page in self.parent.pages{
                //consider placing logic on the survey page tied to a var canSubmit. need different logic for toggles
                if (page.model.mainSlider != nil && page.model.mainSlider?.inputState == -1) {
                    return false
                }
            }
            
            return true
        }
        
        func commitDailySurvey() throws {
            let filename = "SurveyResults.json"
            guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
                else {
                    fatalError("Couldn't find \(filename) in main bundle.")
            }
            
            let filetowrite = URL(string: "file:///Users/liamvanleynseele/Desktop/Dayta/Dayta/Resources/SurveyResults.json")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let currentSurvey = DailySurveyViewModel(survey: self.parent.pages.map{$0.model})
            self.parent.dailySurveys.append(currentSurvey)
            
            do {
                let encoded = try encoder.encode(self.parent.surveyData)
                
                try encoded.write(to: filetowrite!)
                try encoded.write(to: file)
            }
            catch {
                print("Could not write to file: \(error)")
            }
        }

        func commitSurveyData() {
            let filename = "SurveyData.json"
            guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
                else {
                    fatalError("Couldn't find \(filename) in main bundle.")
            }
            
            let filetowrite = URL(string: "file:///Users/liamvanleynseele/Desktop/Dayta/Dayta/Resources/SurveyData.json")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let currentSurvey = DailySurveyViewModel(survey: self.parent.pages.map{$0.model})
            let currentSurveyData = mapDailySurveyToAnalyticsVM(dailySurvey: currentSurvey)
//            self.parent.surveyData.append(currentSurveyData)
            
            do {
                let encoded = try encoder.encode(self.parent.surveyData)
                
                try encoded.write(to: filetowrite!)
                try encoded.write(to: file)
            }
            catch {
                print("Could not write to file: \(error)")
            }
        }
    }
    
}
