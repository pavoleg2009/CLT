//
//  Session.swift
//  CLT
//
//  Created by Oleg Pavlichenkov on 17.05.2021.
//

import Foundation

extension String {
    static let keyNotSet = "key not set"
    static let noTransaction = "no transaction"
}

typealias Storage = [String: String]

// тут будет храниться состояния (сам кэш и стек транзакций)
final class Processor {

    // MARK: Private Variable

    private var storage: Storage = [:]
    private var transactions: [Storage] = []
    private let parser = Parser()

    // MARK: Internal Methods

    /// Метод получает введенную пользователем строку и выозвращает то, что надо вывести в ответ
    /// - Parameter commandString: Строка, введенная пользователем ("сырая" комадна)
    /// - Returns: <#description#>
    func process(_ commandString: String) -> String? {

        let command = parser.parse(commandString)

        switch command {
        case .begin:
            return beginTransaction()
        case .commit:
            return commitTransaction()
        case .rollback:
            return rollbackTransaction()
        case let .set(key, value):
            return set(value, for: key)
        case let .get(key):
            return getValue(for: key)
        case let .delete(key):
            return deleteValue(for: key)
        case let .count(value):
            return count(value)
        case .unknown:
            return "unknown command or wrong parameters"
        }
    }
}

// MARK: - Private Methods

private extension Processor {

    func beginTransaction() -> String? {
        transactions.append(storage)
        return nil
    }

    func commitTransaction() -> String? {
        guard !transactions.isEmpty else {
            return .noTransaction
        }
        transactions.removeLast()
        return nil
    }

    func rollbackTransaction() -> String? {
        guard let previousStorageState = transactions.popLast() else {
            return .noTransaction
        }
        storage = previousStorageState
        return nil
    }

    func set(_ value: String, for key: String) -> String? {
        storage[key] = value
        return nil
    }

    func getValue(for key: String) -> String? {
        return storage[key] ?? .keyNotSet
    }

    func deleteValue(for key: String) -> String? {
        storage[key] = nil
        return nil
    }

    func count(_ value: String) -> String? {
        let count = storage
            .values
            .filter { $0 == value}
            .count
        return "\(count)"
    }
}
