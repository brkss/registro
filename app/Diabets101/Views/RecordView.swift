//
//  RecordView.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("233 mg/dL")
                .font(.custom("CooperBlack", size: 32))
                .bold()
                .foregroundColor(.white)
            Text("12/12/2022 16:03")
                .font(.subheadline)
                .opacity(0.5)
                .foregroundColor(.white)
                
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

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
