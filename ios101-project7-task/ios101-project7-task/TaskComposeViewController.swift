//
//  TaskComposeViewController.swift
//

import UIKit

class TaskComposeViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteField: UITextField!

    // A UI element that allows users to pick a date.
    @IBOutlet weak var datePicker: UIDatePicker!

    // The optional task to edit.
    // If a task is present we're in "Edit Task" mode
    // Otherwise we're in "New Task" mode
    var taskToEdit: Task?

    // When a new task is created (or an existing task is edited), this closure is called
    // passing in the task as an argument so it can be used by whoever presented the TaskComposeViewController.
    var onComposeTask: ((Task) -> Void)? = nil

    // When the view loads, do initial setup for the view controller.
    // 1. If a task was passed in to edit, set all the fields with the "task to edit" properties.
    // 2. Set the title to "Edit Task" in this case.
    //     - `self.title` refers to the title of the view controller and will appear in the navigation bar title.
    //     - The default navigation bar title for this screen has been set in storyboard (i.e. "New Task")
    override func viewDidLoad() {
        super.viewDidLoad()

    
        if let task = taskToEdit {
            
            titleField.text = task.title
            
            noteField.text = task.note
            
            datePicker.date = task.dueDate

            // 2.
            self.title = "Edit Task"
        }
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        
        guard let title = titleField.text,
              !title.isEmpty
        else {
            
            presentAlert(title: "Oops...", message: "Make sure to add a title!")
            
            return
        }
        
        var task: Task
        
        if let editTask = taskToEdit {
            
            task = editTask
            
            task.title = title
            task.note = noteField.text
            
            
            task.dueDate = datePicker.date
            
        } else {
            
            
            task = Task(title: title,
                        
                        note: noteField.text,
                        
                        dueDate: datePicker.date)
        }
        
        onComposeTask?(task)
    
        dismiss(animated: true)
    }

    
    @IBAction func didTapCancelButton(_ sender: Any) {
       
        
        dismiss(animated: true)
    }

    // A helper method to present an alert given a title and message.
    // 1. Create an Alert Controller instance with, title, message and alert style.
    // 2. Create an Alert Action (i.e. an alert button)
    //    - You could add an action (i.e. closure) to be called when the user taps the associated button.
    // 3. Add the action to the alert controller
    // 4. Present the alert
    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }
}
