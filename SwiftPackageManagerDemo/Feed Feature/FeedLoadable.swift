//
//  FeedLoadable.swift
//  SPMDemo
//
//  Created by Ravi Kiran HR on 20/03/22.
//

import Foundation

typealias FeedResult = Result<[FeedItem], Error>

protocol FeedLoadable {
    func load(completion: @escaping(FeedResult) -> Void)
}
