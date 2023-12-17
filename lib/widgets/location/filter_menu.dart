import 'package:boardlooker_mobile/models/enums/index.dart';
import 'package:boardlooker_mobile/widgets/index.dart';
import 'package:flutter/material.dart';

class FilterMenu extends StatefulWidget{
  final VoidCallback onActiveChanged;
  final Function(LocationType?) onTypeChanged;

  const FilterMenu({
    required this.onTypeChanged,
    required this.onActiveChanged,
    super.key
  });

  @override
  FilterMenuState createState() => FilterMenuState();
}

class FilterMenuState extends State<FilterMenu>{

  @override
  Widget build(BuildContext context) {
    LocationType?  locType = FilterData.of(context)?.data;
    bool isActive = FilterData.of(context)!.isActive;
    return Card(
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: SizedBox(
          height: 260.0,
          width: 200.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<LocationType?>(
                          onChanged: (LocationType? value) {
                            setState(() {
                              locType = value;
                              widget.onTypeChanged(locType);
                            });
                          },
                          value: null,
                          groupValue: locType,
                        ),
                        const Text('Все',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<LocationType?>(
                          onChanged: (LocationType? value) {
                            setState(() {
                              locType = value;
                            });
                            widget.onTypeChanged(locType);
                          },
                          value: LocationType.bar,
                          groupValue: locType,
                        ),
                        const Text('Бар',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<LocationType?>(
                          onChanged: (LocationType? value) {
                            setState(() {
                              locType = value;
                            });
                            widget.onTypeChanged(locType);
                          },
                          value: LocationType.cafe,
                          groupValue: locType,
                        ),
                        const Text('Кафе',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                        ),
                      ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<LocationType?>(
                          onChanged: (LocationType? value) {
                            setState(() {
                              locType = value;
                            });
                            widget.onTypeChanged(locType);
                          },
                          value: LocationType.hookah,
                          groupValue: locType,
                        ),
                        const Text('Кальянная',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio<LocationType?>(
                          onChanged: (LocationType? value) {
                            setState(() {
                              locType = value;
                            });
                            widget.onTypeChanged(locType);
                          },
                          value: LocationType.other,
                          groupValue: locType,
                        ),
                        const Text('Другое',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: (){
                        isActive = !isActive;
                        widget.onActiveChanged();
                        }, icon: const Icon(Icons.filter_alt_outlined,
                  size: 20.0,
                  color: Colors.black,
                ),
                )
              ],
            ),
          ),
        ),
    );
  }
  
}