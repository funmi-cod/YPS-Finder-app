import 'package:finder_app/src/core/utils/constant/util.dart';
import 'package:finder_app/src/features/intro/bloc/intro_bloc/intro_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IntroCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<IntroCubit>(context);
    super.initState();
  }

  Widget _showMapView() {
    if (_cubit.data == null) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFFFBF00)),
      );
    }

    return Positioned(
      top: 0,
      child: Container(
        alignment: Alignment.topCenter,
        height: scaledHeight(context).h,
        width: scaledWidth(context).w,
        child: FlutterMap(
          options: MapOptions(
            center:
                _cubit.data != null
                    ? LatLng(
                      _cubit.data!.latitude ?? 0.0,
                      _cubit.data!.longitude ?? 0.0,
                    )
                    : LatLng(19.018255973653343, 72.84793849278007),
            maxZoom: 18,
            interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
            // zoom: 13,
            bounds: LatLngBounds.fromPoints([
              _cubit.data != null
                  ? LatLng(
                    _cubit.data!.latitude ?? 0.0,
                    _cubit.data!.longitude ?? 0.0,
                  )
                  : LatLng(19.018255973653343, 72.84793849278007),
            ]),
            boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(30)),
          ),

          children: [
            TileLayer(
              tileDisplay: TileDisplay.instantaneous(),
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",

              userAgentPackageName: 'com.example.mappy',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 180,
                  height: 180,
                  point:
                      _cubit.data != null
                          ? LatLng(
                            _cubit.data!.latitude ?? 0.0,
                            _cubit.data!.longitude ?? 0.0,
                          )
                          : LatLng(19.018255973653343, 72.84793849278007),
                  builder: (context) {
                    return Icon(FontAwesomeIcons.locationDot);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFFFBF00)),
      body: SafeArea(
        child: Stack(
          children: [
            _showMapView(),
            Positioned(
              top: 30,
              child: Padding(
                padding: EdgeInsets.all(20),
                child:
                    _cubit.data != null
                        ? Container(
                          height: 40.h,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Text(
                              _cubit.data!.countryName ?? '',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                        : Container(
                          height: 50.h,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
