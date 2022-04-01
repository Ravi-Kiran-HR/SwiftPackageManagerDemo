//
//  HTTPClient.swift
//  SPMDemo
//
//  Created by Ravi Kiran HR on 20/03/22.
//

import Foundation

typealias APIResult = Result<(Data, HTTPURLResponse), Error>

protocol HTTPClient {
    func get(from url: URL, completion: @escaping(APIResult) -> Void)
}
