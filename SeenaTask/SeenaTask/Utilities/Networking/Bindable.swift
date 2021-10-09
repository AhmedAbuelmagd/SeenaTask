//
//  Bindable.swift
//  SeenaTask
//
//  Created by Ahmed Abuelmagd on 09/10/2021.
//

class Bindable<T> {
    typealias Listener = ((T) -> Void)
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ v: T) {
        self.value = v
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

}