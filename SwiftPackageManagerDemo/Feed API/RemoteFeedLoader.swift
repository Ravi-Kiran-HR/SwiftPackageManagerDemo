//
//  RemoteFeedLoader.swift
//  SPMDemo
//
//  Created by Ravi Kiran HR on 20/03/22.
//

import Foundation

class RemoteFeedLoader: FeedLoadable {
    let client: HTTPClient
    let url: URL
    
    init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    func load(completion: @escaping (FeedResult) -> Void) {
        client.get(from: url, completion: { response in
            switch response {
            case .success(let(data, response)):
                completion(FeedItemsMapper.map(data: data, response: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        })
    }
}
