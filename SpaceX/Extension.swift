//
//  Extension.swift
//  SpaceX
//
//  Created by Corey Edh on 1/6/23.
//

import Foundation

extension String{
    
        
        
        func dateFormatter(style: DateFormatter.Style) -> String? {
             let formatter = DateFormatter()
             formatter.dateFormat = "yyyy-MM-dd"
             formatter.timeZone = .current
             formatter.dateStyle = style
             return formatter.string(from: Date())
        
        
    }
    
}
