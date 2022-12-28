//
//  JSONDecoders.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 28/12/2022.
//

import Foundation


struct Record: Codable {
    let id:     String;
    let type:   String;
    let unit:   String;
    let value:  Int;
}
