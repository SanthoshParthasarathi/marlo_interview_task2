import 'package:flutter/material.dart';
import 'package:marlo_task2/model/role.dart';

class InvitedList extends StatelessWidget {
  const InvitedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Role> invitedList = [
      Role(name: "Emperor J", active: "active", role: "Admin"),
    ];
    return ListView.builder(
      itemCount: invitedList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            // tileColor: Colors.white,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  color: Colors.brown[400],
                  height: size.height * 0.05,
                  width: size.width * 0.1,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
            ),
            // trailing: Text(
            //   invitedList[index].role.toString(),
            // ),
            title: Text(
              invitedList[index].name.toString(),
            ),
            subtitle: Text(
              invitedList[index].role.toString(),
            ),
          ),
        );
      },
    );
  }
}
