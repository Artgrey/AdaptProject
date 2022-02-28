//
//  IntToDateConverter.swift
//  AdaptProject
//
//  Created by Krivenkis on 2022-02-28.
//

import Foundation

public extension Int {
    
    func intToDate() -> String{
        let timeInterval = TimeInterval(self)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return "\(dateFormatter.string(from: date))"
    }
}
