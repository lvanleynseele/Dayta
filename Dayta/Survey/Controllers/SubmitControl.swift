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
    @Binding var submitted: Bool
    @Binding var showSubmitAlert: Bool
    
    let button = UIButton()
    
//    let navigator: Navigator = Navigator(nibName: "navigator", bundle: nil)
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIButton {
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
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
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            if(!canSubmit()){
                self.parent.showSubmitAlert = true
            }
            else{
//                for page in self.parent.pages {
//                    let encoded = try encoder.encode(page.model)
//                    print(String(data: encoded, encoding: .utf8)!)
//                }
                
                self.parent.submitted = true
                
                self.parent.button.isEnabled = false
                self.parent.button.setTitleColor(UIColor.gray, for: .disabled)
                
                try commit()
//                self.parent.navigator.navigateOnSubmit()
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
        
        func commit() throws {
            let filename = "SurveyResults.json"
            guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
                else {
                    fatalError("Couldn't find \(filename) in main bundle.")
            }
            
            let filetowrite = URL(string: "file:///Users/liamvanleynseele/Desktop/Dayta/Dayta/Resources/SurveyResults.json")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            var surveys: [DailySurveyViewModel] = loadSurveys(file)
            let currentSurvey = DailySurveyViewModel(survey: self.parent.pages.map{$0.model})
            surveys.append(currentSurvey)
            
            do {
                let encoded = try encoder.encode(surveys)
                
                try encoded.write(to: filetowrite!)
                try encoded.write(to: file)
            }
            catch {
                print("Could not write to file: \(error)")
            }
        }
        
        
        func loadSurveys<T: Decodable>(_ file: URL) -> T {
            let data: Data
            do {
                data = try Data(contentsOf: file)
            } catch {
                fatalError("Couldn't load \(file.absoluteURL.absoluteString) from main bundle:\n\(error)")
            }
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                fatalError("Couldn't parse \(file.absoluteURL.absoluteString) as \(T.self):\n\(error)")
            }
            
        }
    }
    
//    class Navigator: UIViewController {
//
//        override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//            super.init(nibName: "navigator", bundle: nil)
//        }
//
//        required init?(coder: NSCoder) {
//            super.init(coder: coder)
//        }
//
//        func navigateOnSubmit() {
//
//            print(self.navigationController.debugDescription)
//
//            self.navigationController?.popToRootViewController(animated: true)
//
//        }
//
//
//    }
}
