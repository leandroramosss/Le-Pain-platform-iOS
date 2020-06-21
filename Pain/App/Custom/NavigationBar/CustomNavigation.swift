//
//  CustomNavigation.swift
//  Pain
//
//  Created by Leandro Ramos on 6/20/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}
