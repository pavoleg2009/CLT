//
//  TestCases.swift
//  CLT
//
//  Created by Oleg Pavlichenkov on 18.05.2021.
//

import Foundation

typealias Input = [String]
typealias Output = [String?]

struct TestCase {
    let input: Input
    let expected: Output

    static let allCases = [
        tc0, // Set and Get a value
        tc1, // Delete
        tc2, // Count
        tc3, // Commit
        tc4, // Rollback
        tc5, // Nested transactions
    ]
}

let tc0 = TestCase(
    input: ["SET foo 123", "GET foo"],
    expected: [nil, "123"]
)

let tc1 = TestCase(
    input: ["SET foo 123", "GET foo",
            "DELETE foo", "GET foo"
    ],
    expected: [nil, "123",
               nil, "key not set"
    ]
)

let tc2 = TestCase(
    input: ["SET foo 123", "SET bar 456", "SET baz 123",
            "COUNT 123", "COUNT 456"],
    expected: [nil, nil, nil,
               "2", "1"]
)

let tc3 = TestCase(
    input: [
        "BEGIN",
            "SET foo 456",
        "COMMIT",
        "ROLLBACK",
        "GET foo"
    ],
    expected: [
        nil,
            nil,
        nil,
        "no transaction",
        "456"
    ]
)

let tc4 = TestCase(
    input:[
        "SET foo 123", "SET bar abc",
        "BEGIN",
            "SET foo 456", "GET foo",
            "SET bar def", "GET bar",
        "ROLLBACK",
        "GET foo", "GET bar",
        "COMMIT"
        ],
    expected: [
        nil, nil,
        nil,
            nil, "456",
            nil, "def",
        nil,
        "123", "abc",
        "no transaction"
    ]
)

let tc5 = TestCase(
    input: [
        "SET foo 123", "SET bar abc",
        "BEGIN",
            "SET foo 456", "GET foo",
            "SET bar def", "GET bar",
        "ROLLBACK",
        "GET foo", "GET bar",
        "COMMIT"
        ],
    expected: [
        nil, nil,
        nil,
            nil, "456",
            nil, "def",
        nil,
        "123", "abc",
        "no transaction"
    ]
)

