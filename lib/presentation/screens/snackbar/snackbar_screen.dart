import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, //es un modal/dialog que no se puede cerrar sin los botones(por así decirlo lo hace obligatorio)
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text(
            'Deserunt sunt non irure non quis eu laboris id culpa non ut consectetur. Ullamco esse commodo esse sunt officia. Dolor fugiat officia eu ullamco anim. Exercitation voluptate proident ex nostrud laborum. Sunt nostrud aute duis occaecat consectetur. Nulla occaecat exercitation tempor et laborum laboris ullamco elit nulla proident.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context);
              },
              child: const Text('Licencias usadas')),
          FilledButton.tonal(
              onPressed: () {}, child: const Text('Mostrar diálogo')),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text('Mostar Snackbar')),
    );
  }
}
