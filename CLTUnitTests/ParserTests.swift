//
//  CLTUnitTests.swift
//  CLTUnitTests
//
//  Created by Oleg Pavlichenkov on 18.05.2021.
//

import XCTest
@testable import CLT

class ParserTests: XCTestCase {

    var parser: Parser!

    override func setUpWithError() throws {
        try super.setUpWithError()
        parser = Parser()
    }

    override func tearDownWithError() throws {
        parser = nil
        try super.tearDownWithError()
    }

    func testPaser_parseValidBeginCommand() throws {
        // given
        let expectedResult: Command = .begin
        // when
        let result = parser.parse("BEGIN")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_parseInvalidBeginCommand() throws {
        // given
        let expectedResult: Command = .unknown(string: "BEGIN 123")
        // when
        let result = parser.parse("BEGIN 123")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_parseValidCommitCommand() throws {
        // given
        let expectedResult: Command = .commit
        // when
        let result = parser.parse("COMMIT")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_parseValidRollbackCommand() throws {
        // given
        let expectedResult: Command = .rollback
        // when
        let result = parser.parse("ROLLBACK")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_parseValidSetCommand() throws {
        // given
        let expectedResult: Command = .set(key: "SomeKey", value: "SomeValue")
        // when
        let result = parser.parse("SET SomeKey SomeValue")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_parseValidGetCommand() throws {
        // given
        let expectedResult: Command = .get(key: "SomeKey")
        // when
        let result = parser.parse("GET SomeKey")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_parseValidDeleteCommand() throws {
        // given
        let expectedResult: Command = .delete(key: "SomeKey")
        // when
        let result = parser.parse("DELETE SomeKey")
        // then
        XCTAssertEqual(result, expectedResult)
    }


    func testPaser_parseValidCountCommand() throws {
        // given
        let expectedResult: Command = .count(value: "SomeValue")
        // when
        let result = parser.parse("COUNT SomeValue")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_parseInvalidCommand() throws {
        // given
        let expectedResult: Command = .unknown(string: "INVALID_COMMAND 123")
        // when
        let result = parser.parse("INVALID_COMMAND 123")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_lowercasedCommand() throws {
        // given
        let expectedResult: Command = .get(key: "123")
        // when
        let result = parser.parse("get 123")
        // then
        XCTAssertEqual(result, expectedResult)
    }

    func testPaser_trimCommand() throws {
        // given
        let expectedResult: Command = .get(key: "123")
        // when
        let result = parser.parse("get 123  ")
        // then
        XCTAssertEqual(result, expectedResult)
    }
}
