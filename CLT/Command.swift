//
//  Command.swift
//  CLT
//
//  Created by Oleg Pavlichenkov on 18.05.2021.
//

import Foundation

public enum Command: Equatable {
    case begin
    case commit
    case rollback
    case set(key: String, value: String)
    case get(key: String)
    case delete(key: String)
    case count(value: String)
    case unknown(string: String)
}
