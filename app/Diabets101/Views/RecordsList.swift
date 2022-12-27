//
//  RecordsList.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct RecordsList: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Records")
                .foregroundColor(.white)
                .bold()
                .font(.custom("CooperBlack", size: 42))
            ScrollView(showsIndicators: false){
                RecordView()
                RecordView()
                RecordView()
                RecordView()
                RecordView()
                RecordView()
                RecordView()
                RecordView()
                RecordView()
            }
        }
        .padding()
        
    }
}

struct RecordsList_Previews: PreviewProvider {
    static var previews: some View {
        RecordsList()
    }
}
