import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/presentation/home/widgets/house_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_similarity/string_similarity.dart';

class SeeAllPropertiesPage extends StatefulWidget {
  final String lokasiUser;

  const SeeAllPropertiesPage({super.key, required this.lokasiUser});

  @override
  State<SeeAllPropertiesPage> createState() => _SeeAllPropertiesPageState();
}

class _SeeAllPropertiesPageState extends State<SeeAllPropertiesPage> {
  bool isLoading = true;
  List filteredProperties = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final cubit = context.read<PropertyCubit>();
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString('role') ?? 'pembeli';

    await cubit.fetchAllProperties(role);
    _applyFilters();
    setState(() => isLoading = false);
  }

  bool isFuzzyMatch({
    required String lokasiUser,
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
  }) {
    final userLokasi = lokasiUser.toLowerCase();
    final lokasiList = [
      kelurahan?.toLowerCase() ?? '',
      kecamatan?.toLowerCase() ?? '',
      kabupaten?.toLowerCase() ?? '',
      provinsi?.toLowerCase() ?? '',
    ];

    for (final lokasi in lokasiList) {
      if (lokasi.isEmpty) continue;
      final score = lokasi.similarityTo(userLokasi);
      if (score >= 0.4 ||
          lokasi.contains(userLokasi) ||
          userLokasi.contains(lokasi)) {
        return true;
      }
    }
    return false;
  }

  void _applyFilters() {
    final allProperties = context.read<PropertyCubit>().userPostedProperties;
    final results =
        allProperties.where((property) {
          final matchLokasi = isFuzzyMatch(
            lokasiUser: widget.lokasiUser,
            kelurahan: property.kelurahan,
            kecamatan: property.kecamatan,
            kabupaten: property.kabupaten,
            provinsi: property.provinsi,
          );

          if (!matchLokasi) return false;

          final query = searchQuery.toLowerCase();

          return query.isEmpty ||
              (property.namaRumah?.toLowerCase().contains(query) ?? false) ||
              (property.kelurahan?.toLowerCase().contains(query) ?? false) ||
              (property.kecamatan?.toLowerCase().contains(query) ?? false) ||
              (property.kabupaten?.toLowerCase().contains(query) ?? false) ||
              (property.provinsi?.toLowerCase().contains(query) ?? false) ||
              (property.harga?.toString().contains(query) ?? false);
        }).toList();

    setState(() => filteredProperties = results);
  }

  String formatFullLocation({
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
  }) {
    final parts =
        [
          kelurahan,
          kecamatan,
          kabupaten,
          provinsi,
        ].where((e) => (e ?? '').trim().isNotEmpty).toList();

    return parts.isEmpty ? 'Lokasi tidak diketahui' : parts.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20.w,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, color: Colors.black, size: 16.sp),
            SizedBox(width: 4.w),
            Text(
              'Properti di ${widget.lokasiUser}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        actions: const [],
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: TextField(
                      onChanged: (value) {
                        searchQuery = value;
                        _applyFilters();
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 15.w,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                        filteredProperties.isEmpty
                            ? Center(
                              child: Text(
                                'Tidak ada properti yang cocok.',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            )
                            : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: GridView.builder(
                                itemCount: filteredProperties.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16.h,
                                      crossAxisSpacing: 16.w,
                                      childAspectRatio: 0.75,
                                    ),
                                itemBuilder: (context, index) {
                                  final p = filteredProperties[index];
                                  return HouseCard(
                                    title: p.namaRumah ?? 'Tanpa Judul',
                                    price: p.harga?.toString() ?? 'Rp -',
                                    location: formatFullLocation(
                                      kelurahan: p.kelurahan,
                                      kecamatan: p.kecamatan,
                                      kabupaten: p.kabupaten,
                                      provinsi: p.provinsi,
                                    ),
                                  );
                                },
                              ),
                            ),
                  ),
                ],
              ),
    );
  }
}
