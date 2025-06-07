+--------------------+
|      User          |
+--------------------+
| - user_id: UUID    |
| - name: String     |
| - email: String    |
| - goal: String     |
| - experience: Enum |
| - injuries: Text   |
| - created_at: Date |
+--------------------+
         |
         | 1
         |———< creates
         |      *
+-------------------------+
|   VideoSession          |
+-------------------------+
| - session_id: UUID      |
| - user_id: UUID (FK)    |
| - timestamp: DateTime   |
| - lift_type: Enum       |
| - reps: Int             |
| - synced: Boolean       |
| - status: Enum          |
+-------------------------+
         |
         | 1
         |———< contains
         |      3
+---------------------------+
|   CameraFeed              |
+---------------------------+
| - feed_id: UUID           |
| - session_id: UUID (FK)   |
| - view_angle: Enum        |  // e.g., front, side, rear
| - resolution: String      |
| - fps: Int                |
| - file_url: String        |
+---------------------------+

+------------------------------+
|   BiomechanicalAnalysis      |
+------------------------------+
| - analysis_id: UUID          |
| - session_id: UUID (FK)      |
| - processed_at: DateTime     |
| - avg_joint_error: Float     |
| - bar_path_error: Float      |
| - score: Float               |
| - duration_s: Int            |
+------------------------------+
         |
         | 1
         |———< includes
         |      *
+---------------------------+
|   FormFault               |
+---------------------------+
| - fault_id: UUID          |
| - analysis_id: UUID (FK)  |
| - rep_index: Int          |
| - joint: String           |
| - error_type: String      | // e.g., valgus collapse
| - severity: Enum          |
| - video_gif_url: String   |
+---------------------------+

+-----------------------------+
|    TrainingProgram          |
+-----------------------------+
| - program_id: UUID          |
| - user_id: UUID (FK)        |
| - start_date: Date          |
| - duration_weeks: Int       |
| - current_week: Int         |
| - custom: Boolean           |
+-----------------------------+
         |
         | 1
         |———< contains
         |      *
+------------------------------+
|   WeeklyPlan                 |
+------------------------------+
| - plan_id: UUID              |
| - program_id: UUID (FK)      |
| - week_number: Int           |
| - focus_area: String         |
| - volume: String             |
| - accessory_drills: Text     |
+------------------------------+
