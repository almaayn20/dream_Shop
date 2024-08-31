import 'package:foody/Features/profile/presentation/manger/get_user_profile_state.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:foody/core/services/location_service.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart';

class LocationSelectorController extends GetxController {
  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  var selectedLocation = Rxn<LatLng>();
  final GetUserProfileController getUserProfileController = Get.find();
  Map<String, String> geocodedSelectedLocation = Map();
  GoogleMapController? googleMapController;
  var isLoading = false.obs;

  var markers = <Marker>{}.obs;

  @override
  void onInit() async {
    super.onInit();

    selectedLocation.value = LatLng(
        double.parse(
            getUserProfileController.profileEntity.value!.userAddress!.lat!),
        double.parse(
            getUserProfileController.profileEntity.value!.userAddress!.lng!));
    initialCameraPosition = CameraPosition(
      zoom: 17,
      target: selectedLocation.value!,
    );
    await getAddressFromLatLng(
        selectedLocation.value!.latitude, selectedLocation.value!.longitude);
    locationService = LocationService();
    updateMyLocation();
  }

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      isLoading.value = true;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemarks[0];

      geocodedSelectedLocation = {
        'street': place.street!,
        'locality': place.locality!,
        'postalCode': place.postalCode!,
        'country': place.country!,
      };
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void onMapTap(LatLng position) async {
    selectedLocation.value = position;
    setMyLocationMarker();
    await getAddressFromLatLng(
        selectedLocation.value!.latitude, selectedLocation.value!.longitude);
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
      await getAddressFromLatLng(
          selectedLocation.value!.latitude, selectedLocation.value!.longitude);
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
