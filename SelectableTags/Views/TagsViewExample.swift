//
//  TagsViewExample.swift
//  SelectableTags
//
//  Created by Taslim Ansari on 18/08/23.
//

import SwiftUI

struct TagsViewExample: View {
    let tags = ["This", "is an example", "showing", "how to use", "Tagssssssssssssssssssssassadsadasdsada", "TAGS VIEW", "in your code", "Selectable Tags View"]
    @State var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Selectable Tags View")
                .font(.title)
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            TagsView(selectedTag: $name, tagsViewModel: TagsViewModel(tags: tags, font: .systemFont(ofSize: 12), selectedTagColor: .black, unSelectedTagColor: .gray.opacity(0.2),  isSingleLineScrolable: false))
            Spacer()
        }
    }
}

struct TagsViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TagsViewExample(name: "TAGS VIEW")
    }
}
