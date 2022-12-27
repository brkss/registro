//
//  AddRecordView.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct AddRecordView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create Record")
                .font(.custom("CooperBlack", size: 30))
            Spacer()
            HStack{
                
                Spacer()
                Button("1"){
                    print("1")
                }
                .font(.custom("CooperBlack", size: 30))
                .foregroundColor(.white)
                Spacer()
                Button("1"){
                    print("1")
                }
                .font(.custom("CooperBlack", size: 30))
                .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .preferredColorScheme(.dark)
    }
}

struct AddRecordView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecordView()
            .padding()
    }
}
