import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogMenuWidget extends StatelessWidget{
  const DialogMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),
      child: Card(
        color: Colors.white,
        child: SizedBox(
          height: 225.0,
          width: 298.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).goNamed(
                        Routes.city.name,
                        queryParameters: {'city' : null}
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.home_work_outlined,
                      size: 23.0,
                      ),
                      Text('Поменять город',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25.0
                      ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                const Row(
                  children: [
                    Icon(Icons.qr_code,
                      size: 23.0,
                    ),
                    Text('Отсканировать QR',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25.0
                      ),
                    )
                  ],
                ),
                const Divider(),
                const Row(
                  children: [
                    Icon(Icons.nfc,
                      size: 23.0,
                    ),
                    Text('Тег NFC',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25.0
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const Row(
                  children: [
                    Icon(Icons.logout,
                      size: 23.0,
                    ),
                    Text('Выход',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25.0
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    ),
    );
  }

}