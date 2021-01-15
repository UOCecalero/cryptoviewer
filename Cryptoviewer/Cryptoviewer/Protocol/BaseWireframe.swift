//
//  BaseWireframe.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit


// MARK: - BaseWireframe
/// WireframeInterface, protocol that BaseWireframe class should conform
protocol WireframeInterface: class {
}

/// Main template for all ViewController
class BaseWireframe: WireframeInterface {
    
    /// The holder for ViewController
    private unowned var _viewController: UIViewController

    /// The retainer for ViewController  reference upon first access
    private var _temporaryStoredViewController: UIViewController?
    
    /**
     Initialize new BaseWireframe with provided ViewController
     - Parameters:
        - viewController: The ViewController that needs to be activated / showed
     - Returns: A ViewController that inherit capabilities given by the WireframeInterface
     */
    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
}

// MARK: - BaseWireframe Helpers
/// BaseWireframe extra capabilities
extension BaseWireframe {
    /**
     Get current active ViewController that BaseWireframe has
     - Returns: A ViewController from active BaseWireframe
     */
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }

    /**
     Get current NavigationController
     - Returns: A UINavigationController from active BaseWireframe
     */
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

// MARK: - UIViewController Helpers
/// UIViewController extra capabilities
extension UIViewController {
    /**
     Present a Wireframe modally
     - Parameters:
        - wireframe: The target Wireframe to navigate
        - animated: Shows animation when navigating or not
        - completion: Completion handler when navigation are done
     */
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> ())? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
}

// MARK: - UINavigationController Helpers
/// UINavigationController extra capabilities
extension UINavigationController {
    /**
     Pushes a ViewController onto the receiver’s stack and updates the UI
     - Parameters:
        - wireframe: The target Wireframe to navigate
        - animated: Shows animation when navigating or not
     */
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }

    /**
     Replaces all active ViewControllers currently managed by the navigation controller with the specified Wireframe.
     - Parameters:
        - wireframe: The specified Wireframe
        - animated: Shows animation when navigating or not
     */
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
}

