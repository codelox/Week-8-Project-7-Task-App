//
//  Task.swift
//

import UIKit


struct Task: Codable {

   
    var title: String

    
    var note: String?

   
    var dueDate: Date

   
    private(set) var completedDate: Date?

   
   
    let createdDate: Date = Date()

   
    let id: String
    
  
    init(title: String, note: String? = nil, dueDate: Date = Date(), id: String = UUID().uuidString) {
        self.title = title
        self.note = note
        self.dueDate = dueDate
        self.id = id
    }

   
    var isComplete: Bool = false {

       
        didSet {
            if isComplete {
             
                completedDate = Date()
            } else {
                completedDate = nil
            }
        }
    }
    
    mutating func markComplete() {
        isComplete = true
        completedDate = Date()
    }

    mutating func markIncomplete() {
        isComplete = false
        completedDate = nil
    }
}


extension Task {

    
        private static let tasksKey = "tasks"
    
   
    static func save(_ tasks: [Task]) {


        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(tasks)
            UserDefaults.standard.set(data, forKey: tasksKey)
        } catch let error {
            print("Error saving tasks: \(error)")
        }
    }

   
    static func getTasks() -> [Task] {
        
        
        
        guard let data = UserDefaults.standard.data(forKey: tasksKey),
              
              let tasks = try? JSONDecoder().decode([Task].self, from: data) else {
            
            
            return []
        }
        return tasks

     
    }

   
    func save() {

        var tasks = Task.getTasks()
        
        if let index = tasks.firstIndex(where: { $0.id == self.id }) {
            
            tasks[index] = self
            
        } else {
            tasks.append(self)
        }
        Task.save(tasks)
    }
}

