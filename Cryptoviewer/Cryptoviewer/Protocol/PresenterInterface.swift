//
//  PresenterInterface.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

protocol PresenterInterface: class {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
}

// MARK: - Presenter Interface Helpers
/// PresenterInterface extra capabilities (for checking wether it's properly called on ViewController)
extension PresenterInterface {
    /// Throw an error if presenter called viewDidLoad but hasn't been called inside ViewController
    func viewDidLoad() {
        fatalError("viewDidLoad hasn't been called inside ViewController")
    }

    /// Throw an error if presenter called viewWillAppear but hasn't been called inside ViewController
    func viewWillAppear(animated: Bool) {
        fatalError("viewWillAppear hasn't been called inside ViewController")
    }

    /// Throw an error if presenter called viewDidAppear but hasn't been called inside ViewController
    func viewDidAppear(animated: Bool) {
        fatalError("viewDidAppear hasn't been called inside ViewController")
    }

    /// Throw an error if presenter called viewWillDisappear but hasn't been called inside ViewController
    func viewWillDisappear(animated: Bool) {
        fatalError("viewWillDisappear hasn't been called inside ViewController")
    }

    /// Throw an error if presenter called viewDidDisappear but hasn't been called inside ViewController
    func viewDidDisappear(animated: Bool) {
        fatalError("viewDidDisappear hasn't been called inside ViewController")
    }
}
