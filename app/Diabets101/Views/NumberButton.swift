//
//  NumberButton.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct NumberButton: View {
    let num string;
    var body: some View {
        Button("1"){
            print("1")
        }
        .font(.custom("CooperBlack", size: 40))
        .foregroundColor(.white)
        .frame(width: 70, height: 70)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.darkGray1)
        )
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton("1")
    }
}
