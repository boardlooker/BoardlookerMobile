import 'package:boardlooker_mobile/blocs/index.dart';
import 'package:boardlooker_mobile/models/enums/index.dart';
import 'package:boardlooker_mobile/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationScreen extends StatefulWidget{
  final String city;
  const LocationScreen({ required this.city, super.key});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen>{
  LocationType? locType;
  String? nameRegex;
  bool isFilterActive = false;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _ctrl = TextEditingController();
  @override
  void dispose() {
    _scrollController.dispose();
    _ctrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FilterData(
      data: locType,
      isActive: isFilterActive,
      child: Scaffold(
        body: BlocListener<InternetAccessCubit, InternetAccessState>(
          listener: (context, state){
            BlocProvider.of<LocationBloc>(context).add(LocationListRequestedEvent(
                city: widget.city,
                locType: locType?.value,
                nameRegex: nameRegex
            )
            );
          },
          listenWhen: (previous, current) => previous.status == current.status,
          child: Stack(
            children:[
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                AnimatedBuilder(
                  animation: _scrollController,
                  builder: (context, child){
                    return SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      expandedHeight: 140.0,

                      title: const Text('Выберите заведение',
                        style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.5,
                            color: Colors.black
                        ),
                      ),
                      leading: IconButton(
                        icon: SvgPicture.asset(
                          "assets/icon/menu_icon.svg",
                          width: 35.0,
                          height: 35.0,
                        ), onPressed: () {  },
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        // title: const Text('Выберите заведение',
                        //   style: TextStyle(
                        //       fontSize: 28.0,
                        //       fontWeight: FontWeight.w400,
                        //       letterSpacing: -0.5,
                        //       color: Colors.black
                        //   ),
                        // ),
                        background: Column(
                          children: [
                            const SizedBox(
                              height: 75.0,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                                child: SearchBar(
                                  controller: _ctrl,
                                  elevation: const MaterialStatePropertyAll<double>(0.0),
                                  surfaceTintColor:
                                  MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.surface),
                                  padding:
                                  const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 11.0)),
                                  shape: MaterialStatePropertyAll<OutlinedBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                  ),
                                  hintText: 'Поиск',
                                  hintStyle: const MaterialStatePropertyAll<TextStyle>(
                                    TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.0,
                                      color: Colors.black,
                                    )
                                  ),
                                  trailing: [
                                    IconButton(
                                      icon: const Icon(Icons.filter_alt_outlined,
                                        size: 20.0,
                                        color: Colors.black,
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          isFilterActive  = !isFilterActive;
                                        });
                                      },
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                    },
                ),
                BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, state) => state.locations != null
                          ? LocationList(locations: state.locations!
                          .where((loc) => loc.locationCity == widget.city).toList()
                        ,)
                          : const SliverToBoxAdapter(
                        child: Center(
                            child: CircularProgressIndicator()
                        ),
                      )
                )
              ],
            ),
            Positioned(
                top: 90,
                right: 30,
                child: isFilterActive
                    ? FilterMenu(
                  onTypeChanged: (type) {
                    setState(() {
                      locType = type;
                    });
                  },
                  onActiveChanged: () {
                    setState(() {
                      isFilterActive = !isFilterActive;
                    });
                  },)
                    : Container()
            )]
          ),
        )
      ),
    );
  }
  @override
  void initState() {
    BlocProvider.of<LocationBloc>(context).add(LocationListRequestedEvent(
        city: widget.city,
        locType: locType?.value,
        nameRegex: nameRegex
    )
    );
    super.initState();
  }

}