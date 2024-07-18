//
//  TagView.swift
//  SelectableTags
//
//  Created by Taslim Ansari on 18/08/23.
//

import SwiftUI

internal struct TagView: View {
    
    @Binding var selectedTag: String
    let tagName: String
    let selectedTagColor: Color
    let unSelectedTagColor: Color
    let selectedTextColor: Color
    let unSelectedTextColor: Color
    let hPadding: CGFloat
    let vPadding: CGFloat
    let font: UIFont
    let borderColor: UIColor = .gray
    
    var body: some View {
        Text(tagName)
            .font(Font(font))
            .truncationMode(.tail)
            .lineLimit(1)
            .foregroundColor(selectedTag == tagName ? selectedTextColor : unSelectedTextColor)
            .padding(.horizontal, hPadding)
            .padding(.vertical, vPadding)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(selectedTag == tagName ? selectedTagColor : unSelectedTagColor)
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(borderColor), lineWidth: 1)
                }.padding(1)
            )
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(selectedTag: .constant("MyTag"), tagName: "MyTag", selectedTagColor: .black, unSelectedTagColor: .white, selectedTextColor: .white, unSelectedTextColor: .black, hPadding: 10, vPadding: 10, font: .systemFont(ofSize: 14))
    }
}
