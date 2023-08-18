//
//  TagsViewExample.swift
//  SelectableTags
//
//  Created by Taslim Ansari on 18/08/23.
//

import SwiftUI

struct TagsViewExample: View {
//    let tags = ["Workout Outfits", "Travel Essentials", "Sneakers", "Payday Treats", "Summer Collection"]
    let tags = ["This", "is an example", "showing", "how to use", "TAGS VIEW", "in your code"]
    @State var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Selectable Tags View")
                .font(.title)
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            TagsView(tags: tags, selectedTag: $name)
            Spacer()
        }
    }
}

struct TagsViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TagsViewExample(name: "TAGS VIEW")
    }
}
