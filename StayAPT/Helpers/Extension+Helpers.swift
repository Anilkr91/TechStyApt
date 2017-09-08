//
//  Extension+Helpers.swift
//  StayAPT
//
//  Created by admin on 08/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

extension String {
    func removeAllSpaces () -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}
