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
            Spacer()
            VStack(alignment: .center){
                Text("244 mg/Dl")
                    .font(.custom("CooperBlack", size: 50))
            }.frame(maxWidth: .infinity)
            Spacer()
            HStack{
                NumberButton(num: "1")
                Spacer()
                NumberButton(num: "2")
                Spacer()
                NumberButton(num: "3")
            }
            .padding(.top)
            HStack{
                NumberButton(num: "4")
                Spacer()
                NumberButton(num: "5")
                Spacer()
                NumberButton(num: "6")
            }
            .padding(.top)
            
            HStack{
                NumberButton(num: "7")
                Spacer()
                NumberButton(num: "8")
                Spacer()
                NumberButton(num: "9")
            }
            .padding(.top)
            HStack{
                
                NumberButton(num: "0")
                Spacer()
                NumberButton(num: "!")
            }
            .padding(.top)
            Button("SAVE"){
                print("SAVE")
            }.foregroundColor(.white)
                .font(.custom("CooperBlack", size: 30))
                .frame(maxWidth: .infinity)
                .padding()
                
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.darkGray1)
                    
                )
                .padding(.top)
                
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
