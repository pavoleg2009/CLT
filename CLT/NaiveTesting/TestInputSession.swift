//
//  TestInputSession.swift
//  CLT
//
//  Created by Oleg Pavlichenkov on 18.05.2021.
//

import Foundation

// Тестовая сессия для работы с тестовыми данными вместо ручного ввода
final class TestInputSession {

    func start() {

        for (index, testCase) in TestCase.allCases.enumerated() {
            print("\nTest #\(index)")
            // каждый тетс-кейс - это как отдельный запуск приложения
            let processor = Processor()
            var output: [String?] = []

            for input in testCase.input {
                output.append(processor.process(input))
            }

            if output == testCase.expected {
                print("✅ PASS")
                print("\tinput: \(testCase.input)")
                print("\toutput: \(output)")
            } else {
                print("🚫 FAIL")
                print("\tinput: \(testCase.input)")
                print("\texpected: \(testCase.expected)")
                print("\toutput: \(output)")
            }
        }
    }
}
