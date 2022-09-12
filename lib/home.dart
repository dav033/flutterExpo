import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:precios/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Usuario'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Correo'),
                    ),
                  ),
                  Container(
                    //color: Theme.of(context).colorScheme.secondary,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    // E padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirmar Contraseña'),
                    ),
                  ),
                  Container(
                      color: Theme.of(context).colorScheme.secondary,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        child: const Text('Enviar'),
                      )),
                  Positioned.fill(
                    top: 10,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Consumer<ThemeProvider>(
                          builder: (context, provider, child) {
                        return DropdownButton<String>(
                          value: provider.currentTheme,
                          items: [
                            //Light, dark, and system
                            DropdownMenuItem<String>(
                              value: 'light',
                              child: Text(
                                'Light',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),

                            DropdownMenuItem<String>(
                              value: 'dark',
                              child: Text(
                                'Dark',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                          onChanged: (String? value) {
                            provider.changeTheme(value ?? 'system');
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ))),
    );
  }
}
