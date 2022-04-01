//
//  ContentView.swift
//  SwiftPackageManager
//
//  Created by Ravi Kiran HR on 01/04/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var listViewModel = ListViewModel()
    
    var body: some View {
        List(listViewModel.feedItems) { feedItem in
            Text(feedItem.title)
        }.onAppear {
            listViewModel.fetchItems()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
