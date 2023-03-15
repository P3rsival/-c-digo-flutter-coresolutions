import 'package:coresolutions/widgets/logo_coreinvent.dart';
import 'package:flutter/material.dart';

class RecoverIdendity extends StatelessWidget {
  const RecoverIdendity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.16),
            const LogoCoreinvent(),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.16),
            const Text(
              'Restaurar Contraseña!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.16),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Text(
                'Introduce tu dirección de correo electrónico. Te enviaremos un mensaje con las instrucciones para restaurar tu contraseña.',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.16),
            const Icon(Icons.language),
            const SizedBox(width: 5),
            const Text('Español'),
            TextButton(onPressed: () {}, child: Text('Cambiar'))
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
