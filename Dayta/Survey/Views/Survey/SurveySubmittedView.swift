//
//  SurveySubmittedView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/11/23.
//

import SwiftUI

struct SurveySubmittedView: View {
    var body: some View {
        Text("Survey has been submitted")
        NavigationLink("Home", destination: ContentView())
    }
}

struct SurveySubmittedView_Previews: PreviewProvider {
    static var previews: some View {
        SurveySubmittedView()
    }
}
