//
//  AddRecordView.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct AddRecordView: View {
    @State private var val: Int = 0;
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            VStack(alignment: .center){
                Text("\(val) mg/DL")
                    .font(.custom("CooperBlack", size: 50))
            }.frame(maxWidth: .infinity)
            Spacer()
            HStack{
                NumberButton(num: "1", clicked: self.NumberButtonClicked)
                Spacer()
                NumberButton(num: "2", clicked: self.NumberButtonClicked)
                Spacer()
                NumberButton(num: "3", clicked: self.NumberButtonClicked)
            }
            .padding(.top)
            HStack{
                NumberButton(num: "4", clicked: self.NumberButtonClicked)
                Spacer()
                NumberButton(num: "5", clicked: self.NumberButtonClicked)
                Spacer()
                NumberButton(num: "6", clicked: self.NumberButtonClicked)
            }
            .padding(.top)
            
            HStack{
                NumberButton(num: "7", clicked: self.NumberButtonClicked)
                Spacer()
                NumberButton(num: "8", clicked: self.NumberButtonClicked)
                Spacer()
                NumberButton(num: "9", clicked: self.NumberButtonClicked)
            }
            .padding(.top)
            HStack{
                
                NumberButton(num: "0", clicked: self.NumberButtonClicked)
                Spacer()
                NumberButton(num: "!", clicked: self.NumberButtonClicked)
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
        .padding()
    }
    
    func NumberButtonClicked(num: String){
        print("got : \(num)")
        $val += 1;
    }
}

struct AddRecordView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecordView()
    }
}
