//
//  Extension.swift
//  SpaceX
//
//  Created by Corey Edh on 1/6/23.
//

import Foundation

extension String {
    
        func dateFormatter(style: DateFormatter.Style) -> String? {
             let formatter = DateFormatter()
             formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
             formatter.timeZone = .current
             if let date = formatter.date(from: self) {
                 formatter.dateFormat = "MMMM dd, yyyy"
                 return formatter.string(from: date)
             }
             return nil
        
    }
    
}
