//
//  Date.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 28/12/2022.
//

import Foundation


func FormatDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy hh:mm"
    let result1 = formatter.string(from: date)
    print("format : \(result1)")
    return result1;
}
