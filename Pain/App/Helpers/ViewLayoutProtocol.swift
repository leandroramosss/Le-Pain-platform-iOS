//
//  ViewLayoutProtocol.swift
//  Le Pain
//
//  Created by Leandro Ramos on 5/23/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol ViewLayoutProtocol: class {
    func setUpLayout()
    func viewHierarchy()
    func setupConstranits()

}

extension ViewLayoutProtocol {
    func setUpNavigation() {}
    func startAnimation() {}
}

