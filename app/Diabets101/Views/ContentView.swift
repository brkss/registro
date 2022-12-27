//
//  ContentView.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    var body: some View {
        TabView{
           RecordsList()
                .tabItem{
                    Label(
                        "records", systemImage: "list.bullet.indent"
                    )
                }
            AddRecordView()
                .tabItem{
                    Label("add", systemImage: "plus.circle")
                }
        }
        .preferredColorScheme(.dark)
        /*
        VStack(alignment: .leading){
                    RecordsList()
                }
                .edgesIgnoringSafeArea(.bottom)
                    .background(Color.black)
    */
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
