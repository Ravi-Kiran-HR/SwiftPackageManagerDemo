//
//  FeedItemsMapper.swift
//  SPMDemo
//
//  Created by Ravi Kiran HR on 20/03/22.
//

import Foundation

class FeedItemsMapper {
    
    struct Item: Decodable {
        var id: Int
        var userId: Int
        var title: String
        
        var feedItem: FeedItem {
            FeedItem(id: id, userId: userId, title: title)
        }
    }
    
    static func map(data: Data, response: HTTPURLResponse) -> FeedResult {
        guard response.statusCode == 200, let items = try? JSONDecoder().decode([Item].self, from: data) else {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }
        let feedItems: [FeedItem]  = items.map { $0.feedItem }
        
        return .success(feedItems)
    }
}
