//
//  RecordView.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI
struct RecordView: View {
    var value:  Int     = 0;
    var unit:   String  = "";
    var date:   Date    ;
    var body: some View {
        VStack(alignment: .leading){
            Text("\(value) \(unit)")
                .font(.custom("CooperBlack", size: 32))
                .bold()
                .foregroundColor(.white)
            Text("\(FormatDate(date: date))")
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
        
    func FormatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy hh:mm"
        //formatter.timeZone = TimeZone(abbreviation: "UTC+1")
        let result1 = formatter.string(from: date)
        print("format : \(result1)")
        return result1;
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(value: 100, unit: "mg/dl", date: Date.now)
    }
}
