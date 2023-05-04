//
//  SubmitView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import SwiftUI

struct SubmitView: View {
    var body: some View {
        Button(action: {
                
            },
               label: { Text("Submit")})
        .buttonStyle(BlueButton())
    }
}

struct SubmitView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitView()
    }
}
