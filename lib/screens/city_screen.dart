import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CityScreen extends StatefulWidget{
  final String? selectedCity;

  const CityScreen({required this.selectedCity, super.key});

  @override
  CityScreenState createState() => CityScreenState();

}

class CityScreenState extends State<CityScreen>{
  String? selectedCity;
  
  final List<String> _cities= [
    'Москва',
    'Санкт-Петербург',
    'Новосибирск',
    'Казань',
    'Екатеринбург'
  ];

  @override
  void initState() {
    selectedCity = widget.selectedCity;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: AlignmentDirectional.topCenter,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownMenu(
                menuHeight: 180.0,
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
                selectedTrailingIcon: Transform(
                  origin: const Offset(0.0, 10.0),
                  transform: Matrix4.rotationX(3.141),
                  child: SvgPicture.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? "assets/icon/arrow_down_dark.svg"
                        : "assets/icon/arrow_down_light.svg",
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                trailingIcon: SvgPicture.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? "assets/icon/arrow_down_dark.svg"
                      : "assets/icon/arrow_down_light.svg",
                  width: 20.0,
                  height: 20.0,
                ),
                hintText: 'Выберите город',
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
                dropdownMenuEntries: _cities.map((city){
                  return DropdownMenuEntry(
                    value: city,
                    label: city,
                  );
                }).toList(),
                onSelected: (String? city){
                  setState(() {
                    selectedCity = city;
                  });
                  GoRouter.of(context).goNamed(
                      Routes.location.name,
                      queryParameters: {'city' : selectedCity}
                  );
                },
              ),
              const SizedBox(height: 41,),
              const Text('... в котором вы хотите арендовать игру',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                letterSpacing: -0.5
              ),
              )
            ],
          )
      ),
    );
  }

}