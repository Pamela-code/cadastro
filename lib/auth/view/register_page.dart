import 'package:cadastro/auth/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final phoneMask = MaskTextInputFormatter(mask: "(##)#####-####)");
  final numbers = RegExp(r'[0-9]+');
  final emailValidate = RegExp(r'[@]');
  RegisterController controller = RegisterController();

  registrar() async {
    try {
      await RegisterController()
          .registrar(controller.email.text, controller.password.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 47),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Faça seu cadastro',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        controller: controller.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe o seu nome completo';
                          } else if (numbers.hasMatch(value)) {
                            return 'Informe seu nome corretamente';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Nome completo',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        controller: controller.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe o seu email';
                          } else if (emailValidate.hasMatch(value) == false) {
                            return 'informe seu e-mail corretamente';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        controller: controller.phone,
                        keyboardType: TextInputType.number,
                        inputFormatters: [phoneMask],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe o seu telefone';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Telefone',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Observer(
                              builder: (_) {
                                return TextFormField(
                                  controller: controller.password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Informe sua senha';
                                    } else if (value.length < 6) {
                                      return 'Sua senha deve ter no mínimo 6 dígitos';
                                    }
                                    return null;
                                  },
                                  obscureText: controller.obscuredText,
                                  decoration: const InputDecoration(
                                    hintText: 'Senha',
                                    hintStyle: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                    border: InputBorder.none,
                                  ),
                                );
                              },
                            ),
                          ),
                          Observer(
                            builder: (_) {
                              return IconButton(
                                onPressed: () {
                                  controller.obscuredText =
                                      !controller.obscuredText;
                                },
                                icon: controller.obscuredText
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.black54,
                                      ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Observer(builder: (_) {
                        return Checkbox(
                          shape: const CircleBorder(),
                          value: controller.acceptTerms,
                          onChanged: (value) {
                            controller.acceptTerms = value!;
                          },
                        );
                      }),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('Li e concordo com os'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Termos de uso'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('e'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Política de privacidade'),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registrar();
                      }
                    },
                    child: const Text('Cadastrar'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Já tem uma conta?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
