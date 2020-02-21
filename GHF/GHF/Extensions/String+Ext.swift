//
//  String+Ext.swift
//  GHF
//
//  Created by Felipe on 26-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

//: ** this extension has no utility because we're using .iso8601 and transform the User model createdAt from String to Date**
import Foundation

extension String{
    func convertToDate() -> Date?{
        let dateFormatter   = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd'T'HH:mm:ssZ"//dateFormatter.date use this
        dateFormatter.locale        = Locale(identifier: "es_CL")
        dateFormatter.timeZone      = .current
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String{
        guard let date = self.convertToDate() else { return "N/A"}
        return date.convertToMonthYearFormat()
    }
}
