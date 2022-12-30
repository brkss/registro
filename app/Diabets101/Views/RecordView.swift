//
//  RecordView.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI
struct RecordView: View {
    var record: Record;
    @Binding public var showInfo: Bool;
    var body: some View {
        VStack(alignment: .leading){
            
            Text("\(record.value) \(record.unit)")
                .font(.custom("CooperBlack", size: 32))
                .bold()
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
            
            Text("\(FormatDate(date: record.created_at))")
                .font(.subheadline)
                .opacity(0.5)
                .foregroundColor(.white)
                //.padding(EdgeInsets(top: 10))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.darkGray1)
        )
        .padding(.top)
        
    }
        
    
}
/*
struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(value: 100, unit: "mg/dl", date: Date.now)
    }
}
*/
