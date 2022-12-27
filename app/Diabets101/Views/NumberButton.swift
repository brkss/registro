//
//  NumberButton.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct NumberButton: View {
    var num: String = "";
    var body: some View {
        Button(num){
            print(num)
        }
        .font(.custom("CooperBlack", size: 40))
        .foregroundColor(.white)
        .frame(width: 90, height: 90)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.darkGray1)
        )
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(num: "1")
    }
}
