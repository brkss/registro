//
//  ContentView.swift
//  Diabets101
//
//  Created by Brahim Berkasse on 27/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
           RecordsList()
                .tabItem("records", systemImage: "list.bullet.indent")
        }
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
