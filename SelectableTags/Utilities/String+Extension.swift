//
//  String+Extension.swift
//  SelectableTags
//
//  Created by Taslim Ansari on 18/08/23.
//

import Foundation
import UIKit

extension String {
    /// Get size of label using font
    /// - Parameter font: font description
    /// - Returns: Size
    func sizeUsingFont(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}
