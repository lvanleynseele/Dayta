//
//  ModelData.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/4/23.
//

import Foundation
import Combine
import SwiftUI

final class ModelData: ObservableObject {
    @Published var surveyPages: [SurveyPageViewModel] = load("SurveyPages.json")
    @Published var profile = UserViewModel.Liam
    @Published var dailySurveys: [DailySurveyViewModel] = loadDailySurveys("SurveyResults.json")

   @Published var surveyData: [SurveyPageAnalyticsViewModel] = load("SurveyData.json")
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
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


func loadDailySurveys<T: Decodable>(_ filename: String) -> T {
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
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func loadSurveyData(_ filename: String) -> [SurveyPageAnalyticsViewModel] {
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
        let decoder = JSONDecoder()
        let surveyData = try decoder.decode([SurveyPageAnalyticsViewModel].self, from: data)
        
//        for i in 0...surveyData.count-2 {
//            for j in i+1...surveyData.count-1 {
//
//            }
//        }
        
        return surveyData
    } catch {
        fatalError("Couldn't parse \(filename) as \(SurveyPageAnalyticsViewModel.self):\n\(error)")
    }
}
