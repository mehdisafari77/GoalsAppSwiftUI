//
//  DateUtils.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import Foundation

extension Date {
    func toRelativeDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter.string(from: self)
    }
}
