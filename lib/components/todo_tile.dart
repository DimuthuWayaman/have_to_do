import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction,
      });
      

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
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
          padding: const EdgeInsets.all(24),
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
                child: Text(
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
}
