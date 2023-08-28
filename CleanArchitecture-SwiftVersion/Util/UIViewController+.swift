//
//  UIViewController+.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/28.
//

import UIKit
import Combine
import CombineInterception

extension UIViewController {
    var publisherViewWillAppear: AnyPublisher<Void, Never> {
        let selector = #selector(UIViewController.viewWillAppear(_:))
        return publisher(for: selector)
    }
}
