//
//  main.swift
//  CLT
//
//  Created by Oleg Pavlichenkov on 17.05.2021.
//

import Foundation

let arguments = CommandLine.arguments

if arguments.count == 1 {
    start()
} else {
    handle(arguments)
}

// MARK: - Private

private func start() {
    CLIInputSession().start()
}

private func handle(_ arguments: [String]) {
    if arguments.contains("-h") || arguments.contains("--help") {
        Prompter().showHelp()
    } else if arguments.contains("-t") || arguments.contains("--test") {
        runTests()
    }
}

private func runTests() {
    TestInputSession().start()
}
