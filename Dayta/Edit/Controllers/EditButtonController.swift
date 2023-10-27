//
//  EditButtonController.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/22/23.
//

import Foundation
import SwiftUI
import UIKit

struct EditButtonController: UIViewRepresentable {
    
    var pageId: String
    var attributeId: String
    
    @Binding var editOpen: Bool
    
    let button = UIButton()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIButton {
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(context.coordinator, action: #selector(Coordinator.edit(sender:)), for: .touchUpInside)
//        button.frame(forAlignmentRect: CGRect(x: 10, y: 10, width: 40, height: 20))
        
        return button
    }
    
    
    func updateUIView(_ uiView: UIButton, context: Context) {

    }
    
    class Coordinator: NSObject {
        var parent: EditButtonController
        
        init(_ editButton: EditButtonController) {
            self.parent = editButton
        }
        
        @objc
        func edit(sender: UIButton) throws {
            parent.editOpen = true
            
            editAttribute(pageId: parent.pageId, attributeId: parent.attributeId)
            
            
            
        }
        
        
    }
    
}
