//
//  RecordInfo.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 28/12/2022.
//

import SwiftUI

struct RecordInfo: View {
   
    var record : Record;
    var body: some View {
        VStack {
            Text("\(record.value) \(record.unit)")
                .font(.custom("CooperBlack", size: 35))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
            HStack {
                Text("\(FormatDate(date: record.created_at))")
                   
                Text("|  \(record.type)")
                    .bold()
            }
            //.padding(.top)
            
        }
        .preferredColorScheme(.dark)
    }
}
/*
struct RecordInfo_Previews: PreviewProvider {
    static var previews: some View {
        RecordInfo()
    }
}
*/
