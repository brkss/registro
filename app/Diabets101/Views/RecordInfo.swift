//
//  RecordInfo.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 28/12/2022.
//

import SwiftUI

struct RecordInfo: View {
    var type : String = ""
    var date : Date = Date.now;
    var value: Int = 0;
    var unit : String = "";
    
    var body: some View {
        VStack {
            Text("\(value) \(unit)")
                .font(.custom("CooperBlack", size: 35))
            HStack {
                Text("\(FormatDate(date: date))")
                   
                Text("|  \(type)")
                    .bold()
            }
            .padding(.top)
            
        }
        .preferredColorScheme(.dark)
    }
}

struct RecordInfo_Previews: PreviewProvider {
    static var previews: some View {
        RecordInfo()
    }
}
