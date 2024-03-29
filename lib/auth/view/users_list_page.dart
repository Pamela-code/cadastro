import 'package:cadastro/auth/controller/register_controller.dart';
import 'package:cadastro/auth/view/edit_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: StreamBuilder(
        stream: controller.usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading"),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'Equipe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 190, 234, 255),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return EditModal(
                                  index: index, snapshot: snapshot);
                            });
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                              'Nome: ${snapshot.data!.docs[index]['name']}'),
                          subtitle: Text(
                              'Email: ${snapshot.data!.docs[index]['email']}'),
                          trailing: Text(
                              'Celular: ${snapshot.data!.docs[index]['phone']}'),
                        ),
                      ),
                    );
                  }),
                )),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.plus_one,
                    color: Color.fromARGB(255, 190, 234, 255),
                    size: 70,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
