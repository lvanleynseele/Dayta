//
//  DateFormat.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/20/23.
//

import Foundation



func formatDateFull(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    
    return formatter.string(from: date)
}

func formatDateShort(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    
    return formatter.string(from: date)
}

