//
//  PageControlButtons.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/4/23.
//

import Foundation
import SwiftUI
import UIKit

struct LastPageButton: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    let button = UIButton()
 
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIButton {
        button.setTitle("< Previous", for: .normal)
        button.isEnabled = false
        button.setTitleColor(UIColor.gray, for: .disabled)
        button.addTarget(context.coordinator, action: #selector(Coordinator.previousPage(sender:)), for: .touchUpInside)
        
        button.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        if(currentPage > 0){
            button.isEnabled = true
            button.setTitleColor(UIColor.white, for: .normal)
        }
        else{
            button.isEnabled = false
            button.setTitleColor(UIColor.gray, for: .disabled)
        }
    }
    
    class Coordinator: NSObject {
        var control: LastPageButton

        init(_ control: LastPageButton) {
            self.control = control
        }

        @objc
        func previousPage(sender: UIButton) {
            if(control.currentPage > 0){
                control.currentPage -= 1
            }
            else{
                control.button.isEnabled = false
                control.button.setTitleColor(UIColor.gray, for: .disabled)
            }
            
        }
    }
}
