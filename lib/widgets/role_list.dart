import 'package:flutter/material.dart';
import 'package:marlo_task2/model/role.dart';

class RoleList extends StatelessWidget {
  const RoleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Role> rolesList = [
      Role(name: "Krishna Soundar", active: "active", role: "Admin"),
      Role(name: "Vishnoo B", active: "active", role: "Admin"),
    ];
    return ListView.builder(
      itemCount: rolesList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            // tileColor: Colors.white,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  color: Colors.blue,
                  height: size.height * 0.05,
                  width: size.width * 0.1,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
            ),
            trailing: Text(
              rolesList[index].role.toString(),
            ),
            title: Text(
              rolesList[index].name.toString(),
            ),
            subtitle: Text(
              rolesList[index].active.toString(),
            ),
          ),
        );
      },
    );
  }
}
