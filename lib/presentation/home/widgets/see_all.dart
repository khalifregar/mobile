import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/presentation/home/widgets/house_card.dart';
import 'package:string_similarity/string_similarity.dart';

class SeeAllPropertiesPage extends StatelessWidget {
  final String lokasiUser;

  SeeAllPropertiesPage({
    super.key,
    required this.lokasiUser,
  });

  final Map<String, List<String>> wilayahBandung = {
    'bandung': [
      'cijerah',
      'margahayu',
      'cibaduyut',
      'bojongloa',
      'cimahi',
      'sayati',
      'astana anyar',
      'cibiru',
      'ujungberung',
      'cileunyi',
      'antapani',
      'arcamanik',
    ]
  };

bool isFuzzyMatch(String lokasiProperti, String lokasiUser) {
  final userLokasi = lokasiUser.toLowerCase();
  final lokasiList = lokasiProperti.toLowerCase().split(',');

  for (var lok in lokasiList) {
    final trimmed = lok.trim();
    final score = trimmed.similarityTo(userLokasi);
    if (score >= 0.4 || trimmed.contains(userLokasi) || userLokasi.contains(trimmed)) {
      return true;
    }

    final subAreas = wilayahBandung[userLokasi];
    if (subAreas != null && subAreas.contains(trimmed)) {
      return true;
    }
  }

  return false;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Properti di $lokasiUser'),
        backgroundColor: const Color(0xFFFF6B00),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocBuilder<PropertyCubit, PropertyState>(
        builder: (context, state) {
          final allProperties = context.read<PropertyCubit>().userPostedProperties;

          final filteredProperties = allProperties.where((property) {
            final lokasiProperti = property.lokasi ?? '';
            return isFuzzyMatch(lokasiProperti, lokasiUser);
          }).toList();

          if (filteredProperties.isEmpty) {
            return Center(
              child: Text(
                'Tidak ada properti di $lokasiUser.',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: GridView.builder(
              itemCount: filteredProperties.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final property = filteredProperties[index];
                return HouseCard(
                  title: property.namaRumah ?? 'Tanpa Judul',
                  price: property.harga?.toString() ?? 'Rp -',
                  location: property.lokasi ?? 'Lokasi tidak diketahui',
                );
              },
            ),
          );
        },
      ),
    );
  }
}
