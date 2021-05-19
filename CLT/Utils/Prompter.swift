//
//  Prompter.swift
//  CLT
//
//  Created by Oleg Pavlichenkov on 18.05.2021.
//

import Foundation


final class Prompter {

    func showHelp() {
        let prompt = """
            -t, --test: run embeded tests use
            -h, --help: this manual
            """
        print(prompt)
    }

    func showIntro() {
        let prompt = """
            Please use the following commands:

            SET <key> <value> // store the value for key
            GET <key>         // return the current value for key
            DELETE <key>      // remove the entry for key
            COUNT <value>     // return the number of keys that have the given value
            BEGIN             // start a new transaction
            COMMIT            // complete the current transaction
            ROLLBACK          // revert to state prior to BEGIN call

            Use cmd+С to finish the app
            """
        print(prompt)
        
    }
}
