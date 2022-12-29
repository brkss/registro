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
                CreateRecord()
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
        let n = Int(num)
        if val < 700 {
            val = val * 10 + (n ?? 0)
        }
        if (num == "!" || val > 700) {
            val = 0
        }
    }
    
    func CreateRecord(){
        guard let url = URL(string: Constants.URL + "/record") else {
            print("couldnt create url !")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "value": val,
            "type": "BS",
            "unit": "mg/DL"
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        // Making the request !
        let task = URLSession.shared.dataTask(with: request) { data, _, errr in
            guard let data = data, errr == nil else {
                return;
            }
            do{
                let response = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                val = 0;
            }catch{
                print("")
            }
        }
        task.resume()
    }
}

struct AddRecordView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecordView()
    }
}
