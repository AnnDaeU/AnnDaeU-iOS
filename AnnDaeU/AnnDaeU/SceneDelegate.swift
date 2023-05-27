//
//  SceneDelegate.swift
//  AnnDaeU
//
//  Created by 이민아 on 2023/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
                window = UIWindow(windowScene: windowScene)
                window?.backgroundColor = .systemBackground
                window?.rootViewController = LoginViewController()
                window?.makeKeyAndVisible()
    }

}

