//
//  Parser.swift
//  CLT
//
//  Created by Oleg Pavlichenkov on 18.05.2021.
//

import Foundation

final class Parser {
    // написать юнит-тесты на парсер
    func parse(_ commandString: String) -> Command {
        let elements = commandString
            .trimmingCharacters(in: .whitespaces)
            .split(separator: " ", omittingEmptySubsequences: true)
        // valid command should have at least one element (command itself)
        guard elements.count > 0 else { return .unknown(string: commandString) }
        switch elements[0].uppercased() {
        case "BEGIN" where elements.count == 1:
            return .begin
        case "COMMIT" where elements.count == 1:
            return .commit
        case "ROLLBACK" where elements.count == 1:
            return .rollback
        case "SET" where elements.count == 3:
            return .set(key: String(elements[1]), value: String(elements[2]))
        case "GET" where elements.count == 2:
            return .get(key: String(elements[1]))
        case "DELETE" where elements.count == 2:
            return .delete(key: String(elements[1]))
        case "COUNT" where elements.count == 2:
            return .count(value: String(elements[1]))
        default:
            return .unknown(string: commandString)
        }
    }
}
