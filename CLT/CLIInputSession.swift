//
//  CLIInputSession.swift
//  CLT
//
//  Created by Oleg Pavlichenkov on 18.05.2021.
//

import Foundation

/// Читает данные и консоли и кормит в Просессор
final class CLIInputSession {

    func start() {
        Prompter().showIntro()

        let processor = Processor()
        while true {
            print("> ", terminator: "")
            if let input = readLine(),
               let output = processor.process(input) {
                print(output)
            }
        }
    }
}
