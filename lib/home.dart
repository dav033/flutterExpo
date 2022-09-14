import 'package:flutter/material.dart';
import 'package:precios/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final double height;
  final String orientation;

  const Home({Key? key, required this.height, required this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: orientation == 'portrait' ? height - 200 : height,
          // color: Colors.red,
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Usuario'),
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Correo'),
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Contraseña'),
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Confirmar Contraseña'),
                            style: Theme.of(context).textTheme.bodyText1),
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
                        top: 0,
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
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),

                                DropdownMenuItem<String>(
                                  value: 'dark',
                                  child: Text(
                                    'Dark',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'system',
                                  child: Text(
                                    'System',
                                    style:
                                        Theme.of(context).textTheme.headline6,
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
                  )))),
    );
  }
}
