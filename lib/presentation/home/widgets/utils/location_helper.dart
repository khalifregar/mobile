import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<String?> getCityFromLocation() async {
    try {
      // Pastikan permission aktif
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever ||
            permission == LocationPermission.denied) {
          throw Exception('Akses lokasi ditolak');
        }
      }

      // Ambil posisi saat ini
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Reverse geocode → dapatkan city/kota
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      return placemarks.first.locality ?? 'Tidak diketahui';
    } catch (e) {
      print('❌ Error getCityFromLocation: $e');
      return null;
    }
  }
}
