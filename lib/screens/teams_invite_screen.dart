import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:marlo_task2/model/role.dart';
import 'package:marlo_task2/services/services.dart';
import 'package:oktoast/oktoast.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _role = TextEditingController();

  String? roleNumber;

  String _selected = '';

  List<Role1> rolesList = [
    Role1(roleName: "Admin", roleId: "1"),
    Role1(roleName: "Approver", roleId: "2"),
    Role1(roleName: "Preparer", roleId: "3"),
    Role1(roleName: "Viewer", roleId: "4"),
    Role1(roleName: "Employee", roleId: "5"),
  ];

  void showModal(context) {
    showModalBottomSheet(
        backgroundColor: HexColor("F7F7F7"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 150.0, right: 150, bottom: 20),
                    child: Divider(
                      color: HexColor("C6EBF6"),
                      thickness: 6,
                    ),
                  ),
                  Text(
                    "Team Roles",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 360,
                    alignment: Alignment.center,
                    child: ListView.separated(
                        itemCount: rolesList.length,
                        separatorBuilder: (context, int) {
                          return Divider();
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 45,
                            width: double.infinity,
                            child: GestureDetector(
                                child: Text(
                                  rolesList[index].roleName.toString() +
                                      " | " +
                                      rolesList[index].roleId.toString(),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                onTap: () {
                                  setState(() {
                                    _selected =
                                        rolesList[index].roleName.toString() +
                                            " | " +
                                            rolesList[index].roleId.toString();

                                    _role.text = _selected;
                                    var newString = _selected
                                        .substring(_selected.length - 1);
                                    roleNumber = newString;
                                    // print(newString);
                                  });
                                  Navigator.of(context).pop();
                                }),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Invite"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Invite",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              customTextFieldWidget("Business Email", _email),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // showModalBottomSheet(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return Expanded(
                  //         child: Column(
                  //           children: [
                  //             Text(
                  //               "Team roles",
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             ListView.builder(
                  //                 itemBuilder: (context, index) {
                  //               return Container(
                  //                 child: Text(roles[index]),
                  //               );
                  //             }),
                  //           ],
                  //         ),
                  //       );
                  //     });
                  showModal(context);
                },
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _role,
                  enabled: false,
                  decoration: InputDecoration(
                    fillColor: HexColor("e9eef0"),
                    filled: true,
                    hintText: "Role",
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 420,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                      onPressed: () {
                        ApiHandler.postInviteRequest(
                          _email.text,
                          roleNumber.toString(),context
                        );

                      },
                      child: Text("Continue"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextFieldWidget(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: HexColor("e9eef0"),
          filled: true,
          hintText: title,
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
