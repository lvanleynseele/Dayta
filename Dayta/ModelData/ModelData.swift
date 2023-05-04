//
//  ModelData.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/4/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var surveyPages: [SurveyPageViewModel] = load("SurveyPages.json")
    @Published var profile = UserViewModel.Liam
    @Published var surveyData: [DailySurveyViewModel] = loadSurveyData("SurveyResults.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        //add day score view model constant to an array. Should always be first page
//        var pages: [SurveyPageViewModel] = [DayScoreView().model]
        let decoder = JSONDecoder()
        //append pages to array
        //return array 
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


func loadSurveyData<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = URL(string: "file:///Users/liamvanleynseele/Desktop/Dayta/Dayta/Resources/SurveyResults.json")
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
