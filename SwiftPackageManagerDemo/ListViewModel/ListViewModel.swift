//
//  ListViewModel.swift
//  SPMDemo
//
//  Created by Ravi Kiran HR on 01/04/22.
//

import Foundation
import OSLog

class ListViewModel: ObservableObject {
    @Published var feedItems = [FeedItem]()
    private let loader: FeedLoadable
    
    init(loader: FeedLoadable = RemoteFeedLoader(client: URLSessionHTTPClient(),
                                                 url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)) {
        self.loader = loader
    }
    
    func fetchItems() {
        loader.load { [weak self] result in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self?.feedItems = items
                }
            case .failure(let error):
                Logger().log("\(error.localizedDescription)")
            }
        }
    }
}

