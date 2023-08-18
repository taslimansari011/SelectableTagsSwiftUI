//
//  TagsView.swift
//  SelectableTags
//
//  Created by Taslim Ansari on 18/08/23.
//

import SwiftUI

struct TagsView: View {
    let tags: [String]
    let font: UIFont

    /// Spacings and paddings
    let itemSpacing: CGFloat
    let contentHPadding: CGFloat
    let contentVPadding: CGFloat
    
    /// Colors
    let selectedTagColor: Color
    let unSelectedTagColor: Color
    let selectedTextColor: Color
    let unSelectedTextColor: Color
    
    // Private variables
    private var tagGroups: [[String]] = []
    private var screenWidth = UIScreen.main.bounds.width

    @Binding var selectedTag: String
    
    init(
        tags: [String],
        font: UIFont = .systemFont(ofSize: 14),
        itemSpacing: CGFloat = 10.0,
        contentHPadding: CGFloat = 12.0,
        contentVPadding: CGFloat = 8.0,
        selectedTagColor: Color = .black,
        unSelectedTagColor: Color = .white,
        selectedTextColor: Color = .white,
        unSelectedTextColor: Color = .black,
        selectedTag: Binding<String>
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
        self._selectedTag = selectedTag
        createTagGroups()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(tagGroups, id: \.self) { group in
                HStack(spacing: itemSpacing) {
                    ForEach(group, id: \.self) { tag in
                        TagView(tagName: tag, selectedTag: $selectedTag, selectedTagColor: selectedTagColor, unSelectedTagColor: unSelectedTagColor, selectedTextColor: selectedTextColor, unSelectedTextColor: unSelectedTextColor, hPadding: contentHPadding, vPadding: contentVPadding, font: font)
                    }
                }
            }
        }
        .frame(width: screenWidth - 20)
        .padding(.horizontal, 10)
    }
    
    /// Create tags groups...
    /// eg. tags = ["Hello", "Guys", "What", "is", "going", "on",]
    ///  Tags will be converted into [["Hello", "Guys", "What"], ["is", "going", "on"]]
    ///  So .... row1 = ["Hello", "Guys", "What"]
    /// row2 = ["is", "going", "on"]
    mutating func createTagGroups() {
        let screenWidth = UIScreen.main.bounds.size.width
        var group = [String]()
        var usedWidth: CGFloat = 0
        
        for (index, tag) in tags.enumerated() {
            /// Calculate the tag width by font.
            let tagWidth = tag.sizeUsingFont(usingFont: font).width + (2 * contentHPadding)
            /// Calculate the required and available width
            let requiredWidth = tagWidth + itemSpacing
            let availableWidth = screenWidth - usedWidth
            let canAppend: Bool = requiredWidth <= availableWidth
            /// If this can be added in the current row then append else append it to the next row.
            if canAppend {
                usedWidth += requiredWidth
                group.append(tag)
            } else {
                self.tagGroups.append(group)
                group = [tag]
                usedWidth = requiredWidth
            }
            /// Check if it is the last tag
            if index == tags.count - 1 {
                self.tagGroups.append(group)
            }
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: ["Workout Outfits", "Travel Essentials", "Sneakers", "Payday Treats", "Summer Collection"], selectedTag: .constant("Payday Treats"))
    }
}
