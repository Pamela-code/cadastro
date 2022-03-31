import 'package:cadastro/auth/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EditModal extends StatefulWidget {
  const EditModal({
    Key? key,
    required this.index,
    required this.snapshot,
  }) : super(key: key);
  final int index;
  final snapshot;

  @override
  State<EditModal> createState() => _EditModalState();
}

class _EditModalState extends State<EditModal> {
  RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    controller.name = TextEditingController(
        text: widget.snapshot.data!.docs[widget.index]['name']);
    controller.email = TextEditingController(
        text: widget.snapshot.data!.docs[widget.index]['email']);
    controller.password = TextEditingController(
        text: widget.snapshot.data!.docs[widget.index]['password']);
    controller.phone = TextEditingController(
        text: widget.snapshot.data!.docs[widget.index]['phone']);
    return Column(
      children: [
        const Text('Nome: '),
        Observer(builder: (_) {
          return TextFormField(
            controller: controller.name,
            // initialValue: snapshot.data!.docs[index]['name'],
          );
        }),
        const Text('Email: '),
        Observer(builder: (_) {
          return TextFormField(
            controller: controller.email,
            // initialValue: snapshot.data!.docs[index]['email'],
          );
        }),
        const Text('Celular: '),
        Observer(builder: (_) {
          return TextFormField(
            controller: controller.phone,
            // initialValue: snapshot.data!.docs[index]['phone'],
          );
        }),
        const Text('Senha: '),
        Observer(builder: (_) {
          return TextFormField(
            controller: controller.password,
            // initialValue: snapshot.data!.docs[index]
            // ['password'],
          );
        }),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            controller.atualizar(widget.snapshot.data!.docs[widget.index]['id'],
                'name', controller.name.text);
            Navigator.pop(context);
            controller.clearFields();
          },
          child: const Text('Atualizar dados'),
        )
      ],
    );
  }
}
