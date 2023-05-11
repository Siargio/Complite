//
//  SceneDelegate.swift
//  Complite
//
//  Created by Sergio on 10.05.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let layout = UICollectionViewFlowLayout()
        let viewController = ReminderListViewController(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: viewController)
        UINavigationBar.appearance().tintColor = .blue
        UINavigationBar.appearance().backgroundColor = .systemPink
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
