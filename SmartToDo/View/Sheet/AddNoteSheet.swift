//
//  AddNoteSheet.swift
//  SmartToDo
//
//  Created by user on 23.12.2023.
//

import SwiftUI
import SwiftData
struct AddNoteSheet: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State var noteTitle: String = ""
    @State var noteDesc: String = ""
    
    var body: some View {
        
        Form {
            
            Section (noteTitle.isEmpty ? "Add Note" : "Edit Note") {
                TextField("Title", text: $noteTitle)
                TextField("Description", text: $noteDesc)
                    .frame(height: 80)
                    .lineLimit(3, reservesSpace: true)
            }
            
            Button {
                addNote()

            } label: {
                Text("Done")
            }
        }
    }
    
    
    func addNote(){
        modelContext.insert(Note(title: noteTitle, desc: noteDesc))
    }
}



#Preview {
    AddNoteSheet(noteTitle: "", noteDesc: "")
}
