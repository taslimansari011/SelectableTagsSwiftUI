//
//  TagsView.swift
//  SelectableTags
//
//  Created by Taslim Ansari on 18/08/23.
//

import SwiftUI

public struct TagsView: View {
//    private let tags: [String]
//    private  let font: UIFont
//
//    /// Spacings and paddings
//    private  let itemSpacing: CGFloat
//    private  let contentHPadding: CGFloat
//    private  let contentVPadding: CGFloat
//    private  let isSingleLineScrolable: Bool
//    private  let horizontalPadding: CGFloat
//
//    /// Colors
//    private  let selectedTagColor: Color
//    private  let unSelectedTagColor: Color
//    private  let selectedTextColor: Color
//    private  let unSelectedTextColor: Color
//
//    // Private variables
//    private var tagGroups: [[String]] = []
//    private var screenWidth: CGFloat {
//        UIScreen.main.bounds.width - (2 * horizontalPadding)
//    }

    @Binding var selectedTag: String
    @ObservedObject var tagsViewModel: TagsViewModel
    
//    init(tagsViewModel: TagsViewModel) {
//        self._tagsViewModel = tagsViewModel
//    }
    
    public var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: tagsViewModel.itemSpacing) {
                ForEach(tagsViewModel.tagGroups, id: \.self) { group in
                    ScrollViewReader { scrollProxy in
                        ScrollView(.horizontal) {
                            HStack(spacing: group.count == 1 ? 0 : tagsViewModel.itemSpacing) {
                                ForEach(group, id: \.self) { tag in
                                    TagView(
                                        selectedTag: $selectedTag, tagName: tag,
                                        selectedTagColor: tagsViewModel.selectedTagColor,
                                        unSelectedTagColor: tagsViewModel.unSelectedTagColor,
                                        selectedTextColor: tagsViewModel.selectedTextColor,
                                        unSelectedTextColor: tagsViewModel.unSelectedTextColor,
                                        hPadding: tagsViewModel.contentHPadding,
                                        vPadding: tagsViewModel.contentVPadding,
                                        font: tagsViewModel.font
                                    )
                                    .onTapGesture {
                                        withAnimation {
                                            selectedTag = tag
                                            scrollProxy.scrollTo(tag, anchor: .center)
                                        }
                                    }
                                    .frame(maxWidth: tagsViewModel.screenWidth)
                                }
                                Spacer()
                            }
                        }
                        .scrollDisabled(!tagsViewModel.isSingleLineScrolable)
                        .scrollIndicators(.hidden)
                    }
                }
            }
            .padding(.horizontal, tagsViewModel.horizontalPadding)
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(selectedTag: .constant("Payday Treats"), tagsViewModel: TagsViewModel(tags: ["Workout Outfits", "Travel Essentials", "Sneakers", "PayDay", "Payday Treats Payday Treats Payday Treats Payday Treats Payday Treats Payday Treats", "Summer Collection"], font: .systemFont(ofSize: 10), isSingleLineScrolable: false))
    }
}
