//
//  ListViewModel.swift
//  SPMDemo
//
//  Created by Ravi Kiran HR on 01/04/22.
//

import Foundation
import OSLog
import FeedAPIModule

class ListViewModel: ObservableObject {
    @Published var feedViewItems = [FeedViewItem]()
    private let loader: FeedLoadable
    
    init(loader: FeedLoadable = RemoteFeedLoader(client: URLSessionHTTPClient(),
                                                 url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)) {
        self.loader = loader
    }
    
    func fetchItems() {
        loader.load { [weak self] result in
            switch result {
            case .success(let items):
                let feedViewItems = items.map { feedItem in
                    FeedViewItem(id: feedItem.id, userId: feedItem.userId, title: feedItem.title)
                }
                DispatchQueue.main.async {
                    self?.feedViewItems = feedViewItems
                }
            case .failure(let error):
                Logger().log("\(error.localizedDescription)")
            }
        }
    }
}

