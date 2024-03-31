//
//  Variable.swift
//  LearningUIKit
//
//  Created by Ritesh Yadav on 27/03/24.
//

import Foundation


class Variable<Value> {
    var value: Value {
        didSet {
            DispatchQueue.main.async {
                self.onUpdate?(self.value)
            }
        }
    }

    var onUpdate: ((Value) -> Void)? {
        didSet {
            DispatchQueue.main.async {
                self.onUpdate?(self.value)
            }
        }
    }

    init(_ value: Value, _ onUpdate: ((Value) -> Void)? = nil) {
        self.value = value
        self.onUpdate = onUpdate
        DispatchQueue.main.async {
            self.onUpdate?(self.value)
        }
    }
}
