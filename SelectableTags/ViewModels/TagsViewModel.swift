//
//  TagsViewModel.swift
//  SelectableTags
//
//  Created by Taslim Ansari on 18/07/24.
//

import Foundation
import SwiftUI

class TagsViewModel: ObservableObject {
    
    let tags: [String]
    let font: UIFont
    
    /// Spacings and paddings
    let itemSpacing: CGFloat
    let contentHPadding: CGFloat
    let contentVPadding: CGFloat
    let isSingleLineScrolable: Bool
    let horizontalPadding: CGFloat
    
    /// Colors
    let selectedTagColor: Color
    let unSelectedTagColor: Color
    let selectedTextColor: Color
    let unSelectedTextColor: Color
    
    // Private variables
    @Published var tagGroups: [[String]] = []
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width - (2 * horizontalPadding)
    }
    
    init(
        tags: [String],
        font: UIFont = .systemFont(ofSize: 14),
        itemSpacing: CGFloat = 6.0,
        contentHPadding: CGFloat = 12.0,
        contentVPadding: CGFloat = 8.0,
        horizontalPadding: CGFloat = 16.0,
        selectedTagColor: Color = .black,
        unSelectedTagColor: Color = .white,
        selectedTextColor: Color = .white,
        unSelectedTextColor: Color = .black,
        isSingleLineScrolable: Bool = false
    ) {
        self.tags = tags
        self.font = font
        self.itemSpacing = itemSpacing
        self.contentHPadding = contentHPadding
        self.contentVPadding = contentVPadding
        self.selectedTagColor = selectedTagColor
        self.unSelectedTagColor = unSelectedTagColor
        self.selectedTextColor = selectedTextColor
        self.unSelectedTextColor = unSelectedTextColor
        self.isSingleLineScrolable = isSingleLineScrolable
        self.horizontalPadding = horizontalPadding
        
        self.tagGroups = createTagGroups(tags: tags, font: font, contentHPadding: contentHPadding, itemSpacing: itemSpacing, isSingleLineScrolable: isSingleLineScrolable, screenWidth: screenWidth)
    }
    
    
    /// Create tags groups...
    /// eg. tags = ["Hello", "Guys", "What", "is", "going", "on",]
    ///  Tags will be converted into [["Hello", "Guys", "What"], ["is", "going", "on"]]
    ///  So .... row1 = ["Hello", "Guys", "What"]
    /// row2 = ["is", "going", "on"]
    func createTagGroups(tags: [String], font: UIFont, contentHPadding: CGFloat, itemSpacing: CGFloat, isSingleLineScrolable: Bool, screenWidth: CGFloat) -> [[String]] {
        if isSingleLineScrolable {
            return [tags]
        }

        var tagGroups: [[String]] = []
        
        var group = [String]()
        var usedWidth: CGFloat = 0
        
        for (index, tag) in tags.enumerated() {
            /// Calculate the tag width by font.
            let tagWidth = tag.sizeUsingFont(usingFont: font).width + (2 * contentHPadding)
            /// Calculate the required and available width
            var requiredWidth = tagWidth + itemSpacing
            requiredWidth = requiredWidth >= screenWidth ? screenWidth : requiredWidth
            let availableWidth = screenWidth - usedWidth
            let canAppend: Bool = requiredWidth <= availableWidth
            /// If this can be added in the current row then append else append it to the next row.
            if canAppend {
                usedWidth += requiredWidth
                group.append(tag)
            } else {
                tagGroups.append(group)
                group = [tag]
                usedWidth = requiredWidth
            }
            /// Check if it is the last tag
            if index == tags.count - 1 {
                tagGroups.append(group)
            }
        }
        
        return tagGroups
    }
}
