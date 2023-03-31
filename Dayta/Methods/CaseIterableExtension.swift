//
//  CaseIterableExtension.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.
//

import Foundation

extension CaseIterable where Self: Equatable & RawRepresentable {
    var allCases: AllCases { Self.allCases }
    func next() -> Self {
        let index = allCases.firstIndex(of: self)!
        let next = allCases.index(after: index)
        guard next != allCases.endIndex else { return allCases[index] }
        return allCases[next]
    }
    
    func previous() -> Self {
        let index = allCases.firstIndex(of: self)!
        let previous = allCases.index(index, offsetBy: -1)
        guard previous >= allCases.startIndex else { return allCases[index] }
        return allCases[previous]
    }
    
    static var allValues: [RawValue] {
        return allCases.map { $0.rawValue }
    }
}
