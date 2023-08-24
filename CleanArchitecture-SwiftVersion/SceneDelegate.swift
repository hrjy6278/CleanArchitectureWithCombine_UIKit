//
//  SceneDelegate.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/24.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        configureWindow(scene: scene, rootViewController: generateRootViewController())
    }
    
    private func configureWindow(scene: UIScene, rootViewController: UIViewController) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    private func generateRootViewController() -> UIViewController {
        let rootViewController = ViewController()
        rootViewController.view.backgroundColor = .systemBackground
        
        return rootViewController
    }
}

