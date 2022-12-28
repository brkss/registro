//
//  RecordsList.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct RecordsList: View {
    @State private var records = [Record]();
    @State private var showInfo = false;
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Records")
                .foregroundColor(.white)
                .bold()
                .font(.custom("CooperBlack", size: 42))
            ScrollView(showsIndicators: false){
                ForEach(records, id: \.id) { record in
                    RecordView(
                        value: record.value,
                        unit: record.unit,
                        date: record.created_at,
                        showInfo: $showInfo
                    )
                }
            }
            
        }
        .padding(5)
        .task{
            await fetchRecords()
        }
        .sheet(isPresented: $showInfo){
            RecordInfo(
                type: records[0].type,
                date: records[0].created_at,
                value: records[0].value,
                unit: records[0].unit
            )
                .presentationDetents([.height(UIScreen.main.bounds.height / 1.5)])
        }
        
        
    }
    
    func fetchRecords() async {
        guard let url = URL(string: "http://localhost:4000/records") else{
            print("couldnt create url !")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // decode date from json
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            if let decodedResponse = try? decoder.decode([Record].self, from: data){
                records = decodedResponse;
                print("decodedResponse : \(decodedResponse)")
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
