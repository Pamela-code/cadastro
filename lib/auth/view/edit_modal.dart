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
  void initState() {
    controller.name = TextEditingController(
        text: widget.snapshot.data!.docs[widget.index]['name']);
    controller.email = TextEditingController(
        text: widget.snapshot.data!.docs[widget.index]['email']);
    controller.password = TextEditingController(
        text: widget.snapshot.data!.docs[widget.index]['password']);
    controller.phone = TextEditingController(
        text: widget.snapshot.data!.docs[widget.index]['phone']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Nome: '),
        Observer(builder: (_) {
          return TextFormField(
            controller: controller.name,
          );
        }),
        const Text('Email: '),
        Observer(builder: (_) {
          return TextFormField(
            controller: controller.email,
          );
        }),
        const Text('Celular: '),
        Observer(builder: (_) {
          return TextFormField(
            controller: controller.phone,
          );
        }),
        const Text('Senha: '),
        Observer(builder: (_) {
          return TextFormField(
            controller: controller.password,
          );
        }),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                controller.updateFields(
                  widget.snapshot.data!.docs[widget.index]['id'],
                );
                Navigator.pop(context);
                controller.clearFields();
              },
              child: const Text('Atualizar dados'),
            ),
            TextButton(
              onPressed: () {
                controller.deleteUser(
                  widget.snapshot.data!.docs[widget.index]['id'],
                );
                Navigator.pop(context);
              },
              child: const Text('Deletar usuário'),
            ),
          ],
        )
      ],
    );
  }
}
