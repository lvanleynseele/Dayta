//
//  ExpandableMoreSection.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/24/23.
//

import SwiftUI

struct ExpandableMoreSection: View {
    var model: ExpandableMoreSectionViewModel
    @State private var collapsed: Bool = true
    @State var opened: Bool = false
        
    var body: some View {
        
        VStack {
            Button(
                action: {
                    withAnimation(.spring()){
                        self.collapsed.toggle()
                        if (!opened) {
                            opened = true
                            model.opened = opened
                        }
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
            ScrollView{
                VStack {
                    ForEach(model.morePrompts, id: \.self.id) { _prompt in
                        LabeledToggle(model: _prompt.self)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
                .clipped()
                .transition(.slide)
            }
            
        }
        .frame(minWidth: 0, maxWidth: 350)
    }
}


