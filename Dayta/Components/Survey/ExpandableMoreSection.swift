//
//  ExpandableMoreSection.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/24/23.
//

import SwiftUI

struct ExpandableMoreSection: View {
    var prompts: [LabeledToggle]
    @State private var collapsed: Bool = true
        
    var body: some View {
        VStack {
            Button(
                action: {
                    withAnimation(.spring()){
                        self.collapsed.toggle()
                    }
                },
                label: {
                    HStack {
                        Text("More")
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                ForEach(prompts, id: \.self.id) { _prompt in
                    Toggle(_prompt.label, isOn: _prompt.$input).padding()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .transition(.slide)
        }
        .frame(minWidth: 0, maxWidth: 350)
    }
}


struct ExpandableMoreSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableMoreSection(prompts: [])
    }
}
