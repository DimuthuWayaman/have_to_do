import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/components/dialog_box.dart';


class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  final Function(String)? editFunction;
  
  

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
    
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => _showEditDialog(context),
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              icon: Icons.edit,
              label: 'Edit',
              borderRadius: BorderRadius.circular(12),
            ),
             SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            ),
            


          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                  value: taskCompleted,
                  activeColor: Colors.black,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  checkColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onChanged: onChanged),

              //Task Name
              Flexible(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        taskName,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          decoration: taskCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationColor: taskCompleted
              ? Colors.black // or any color you prefer
              : Colors.transparent,
        ),
      ),
      SizedBox(height: 4), // Adjust spacing between task name and timestamp
      
    ],
  ),
),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
  void _showEditDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: taskName);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: controller,
          onSave: () {
            if (controller.text.isNotEmpty) {
              editFunction?.call(controller.text);
              Navigator.of(context).pop();
            }
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
