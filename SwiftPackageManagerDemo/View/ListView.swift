//
//  ContentView.swift
//  SwiftPackageManager
//
//  Created by Ravi Kiran HR on 01/04/22.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var listViewModel = ListViewModel()
    
    var body: some View {
        List(listViewModel.feedViewItems) { feedItem in
            Text(feedItem.title)
        }.onAppear {
            listViewModel.fetchItems()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
