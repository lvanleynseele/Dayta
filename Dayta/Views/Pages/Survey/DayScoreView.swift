//
//  DayScore.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.
//

import SwiftUI

struct DayScoreView: View {
    var id: String = UUID().uuidString
    var pageLabel: String = "On the whole, how was your day?"
    
    var body: some View {
        VStack(alignment: .leading){
            Text(pageLabel)
                .foregroundColor(Color.blue)
                .font(.title2)
        }
        
        Section{
            SliderInput(model: SliderViewModel(label: "Day Score", prompt: "Rate your day", maximumRating: 7))
        }
    }
}

struct DayScore_Previews: PreviewProvider {
    static var previews: some View {
        DayScoreView()
    }
}
