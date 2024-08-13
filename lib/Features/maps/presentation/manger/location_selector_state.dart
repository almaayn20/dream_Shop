import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:foody/core/services/location_service.dart';
import 'package:location/location.dart';

class LocationSelectorController extends GetxController {
  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  var selectedLocation = Rxn<LatLng>();

  GoogleMapController? googleMapController;

  var markers = <Marker>{}.obs;

  @override
  void onInit() {
    super.onInit();

    selectedLocation.value = LatLng(31.187084851056554, 29.928110526889437);
    initialCameraPosition = CameraPosition(
      zoom: 17,
      target: selectedLocation.value!,
    );
    locationService = LocationService();
    updateMyLocation();
  }

  void onMapTap(LatLng position) {
    selectedLocation.value = position;
    setMyLocationMarker();
  }

  void updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      var currentLocation = await locationService.getCurrentLocation();

      selectedLocation.value =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
      setMyLocationMarker();
      setMyCameraPosition();
      // locationService.getRealTimeLocationData((locationData) {
      //   setMyLocationMarker(locationData);
      //   setMyCameraPosition(locationData);
      // });
    }
  }

  void setMyCameraPosition() {
    var cameraPosition = CameraPosition(
      target: LatLng(
          selectedLocation.value!.latitude, selectedLocation.value!.longitude),
      zoom: 15,
    );

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void setMyLocationMarker() {
    var myLocationMarker = Marker(
      markerId: const MarkerId('my_location_marker'),
      position: LatLng(
          selectedLocation.value!.latitude, selectedLocation.value!.longitude),
    );
    markers.clear();
    markers.add(myLocationMarker);
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    // initMapStyle();
  }

  // void initMapStyle() async {
  //   var nightMapStyle = await DefaultAssetBundle.of(context)
  //       .loadString('assets/map_styles/night_map_style.json');
  //   googleMapController?.setMapStyle(nightMapStyle);
  // }
}
