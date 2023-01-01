//
//  RecordInfo.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 28/12/2022.
//

import SwiftUI

struct RecordInfo: View {
   
    var record : Record;
    var body: some View {
        VStack {
            Spacer()
            Text("\(record.value) \(record.unit)")
                .font(.custom("CooperBlack", size: 35))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
            HStack {
                Text("\(FormatDate(date: record.created_at))")
                
                Text("|  \(record.type)")
                    .bold()
            }
            Spacer()
            Button("Delete"){
                DeleteRecord()
            }
            .padding()
            .frame(width: 200)
            .background(
                RoundedRectangle(cornerRadius: 11)
                    .fill(Color.accentRed)
            )
            .foregroundColor(.white)
            .bold()
        }
        .preferredColorScheme(.dark)
    }
    
    func DeleteRecord(){
        guard let url = URL(string: Constants.URL + "/record") else {
            print("couldn't create url !")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "id": record.id
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request){data, _, err in
            guard let data = data, err == nil else {
                return;
            }
            do{
                _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            }catch {
                print("")
            }
            
        }
        task.resume()
    }
}
/*
struct RecordInfo_Previews: PreviewProvider {
    static var previews: some View {
        RecordInfo()
    }
}
*/
