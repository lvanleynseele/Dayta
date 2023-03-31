//
//  StringOrInt.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.
//

import Foundation

protocol StringOrInt {}

extension Int : StringOrInt {}
extension String: StringOrInt {}
