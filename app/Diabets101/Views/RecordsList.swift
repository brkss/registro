//
//  RecordsList.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct RecordsList: View {
    @State private var records = [Record]();
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Records")
                .foregroundColor(.white)
                .bold()
                .font(.custom("CooperBlack", size: 42))
            ScrollView(showsIndicators: false){
                ForEach(records, id: \.id) { record in
                    RecordView(value: record.value, unit: record.unit)
                }
            }
            
        }
        .padding(5)
        .task{
            await fetchRecords()
        }
        
    }
    
    func fetchRecords() async {
        guard let url = URL(string: "http://localhost:4000/records") else{
            print("couldnt create url !")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Record].self, from: data){
                records = decodedResponse;
            }else{
                print("couldnt decode the data")
            }
        }catch {
                print("something went wrong fetching records !")
        }
    }
}

struct RecordsList_Previews: PreviewProvider {
    static var previews: some View {
        RecordsList()
    }
}
