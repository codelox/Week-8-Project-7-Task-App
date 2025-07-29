# Task Tab - Efficient Task Management App



**Task Tab** is an app that provides a streamlined interface for users to manage their tasks effectively. Designed with simplicity and efficiency in mind, it allows users to create, view, edit, and toggle the completion status of tasks with ease. The app leverages UserDefaults for local storage, ensuring that all tasks are persisted across app launches, providing a seamless user experience. Featuring tab bar navigation, Task Tab offers two main views: a task list for everyday task management and a calendar view to track task deadlines and completion. Each task can include a title, an optional note for additional details, and a due date. Users can mark tasks as complete or incomplete with a simple tap, and the app automatically updates task ordering and storage to reflect these changes. Task Tab is the go-to solution for anyone looking to organize their daily activities and deadlines efficiently.


## Features

The following features are implemented:

- [x] App displays a list of tasks
- [x] Users can add tasks to the list
- [x] Session persists when application is closed and relaunched (tasks dont get deleted when closing app) 
  - [x] Note: You have to quit the app, not minimize it, in order to see the persistence.
- [x] Tasks can be deleted
- [x] Users have a calendar view via navigation controller that displays tasks    
- [x] Tasks can be toggled completed
- [x] User can edit tasks by tapping on the task in the feed view

## Video Walkthrough

<div>
    <a href="https://www.loom.com/share/e9efc6b9fa57452fbe67ab3ff39ccc69">
    </a>
    <a href="https://www.loom.com/share/e9efc6b9fa57452fbe67ab3ff39ccc69">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/e9efc6b9fa57452fbe67ab3ff39ccc69-with-play.gif">
    </a>
</div>

## Notes

One significant challenge in developing the Task Tab app was ensuring seamless data persistence using UserDefaults, specifically when encoding and decoding custom Task objects. The intricacies of handling Codable conformance for complex types and managing JSON serialization presented specific hurdles. This was compounded by the need to uniquely identify and update tasks without duplication, requiring precise logic to manage task IDs effectively within UserDefaults. This aspect underscored the complexity of implementing a reliable local storage solution for custom data types in iOS applications.

## License

    Copyright [2024] [Pragnavi Ravuluri Sai Durga]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License
