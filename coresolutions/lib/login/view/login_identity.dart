import 'package:coresolutions/widgets/logo_coreinvent.dart';
import 'package:flutter/material.dart';

class LogoIdentity extends StatelessWidget {
  const LogoIdentity({super.key});

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
              '¡Hola!',
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
                'Utiliza tus credenciales de usuario para acceder al sistema',
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
