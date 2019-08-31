//
//  Router.swift
//  MoneyManagerTest
//
//  Created by Deepak on 8/27/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import Foundation
import UIKit

class DashboardRouter: Navigator {
    // Here we define a set of supported destinations using an
    // enum, and we can also use associated values to add support
    // for passing arguments from one screen to another.
    enum Destination {
        case loggedOut
    }
    
    // In most cases it's totally safe to make this a strong
    // reference, but in some situations it could end up
    // causing a retain cycle, so better be safe than sorry :)
    private weak var navigationController: UINavigationController?
    
    private weak var currentViewController: UIViewController?
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    init(currentViewController: UIViewController?) {
        self.currentViewController = currentViewController
    }
    
    // MARK: - Navigator
    
    func navigate(to destination: Destination) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = makeViewController(for: destination, withStoryBoard: storyBoard)
        if navigationController != nil {
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            currentViewController?.present(viewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Private
    
    private func makeViewController(for destination: Destination, withStoryBoard storyBoard: UIStoryboard) -> UIViewController {
        var viewControllerID  = ""
        switch destination {
        case .loggedOut:
            viewControllerID = "LoginViewController"
            break
        }
        return storyBoard.instantiateViewController(withIdentifier: viewControllerID) as UIViewController
    }
}
