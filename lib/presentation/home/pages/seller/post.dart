import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/presentation/home/widgets/penjual/custom_text_field.dart';
import 'package:propedia/presentation/home/widgets/penjual/floating_action_button_area.dart';
import 'package:propedia/models/request/stores/property_request.dart';

class PostPenjualanPage extends StatefulWidget {
  const PostPenjualanPage({super.key});

  @override
  State<PostPenjualanPage> createState() => _PostPenjualanPageState();
}

class _PostPenjualanPageState extends State<PostPenjualanPage> {
  static const Color primaryOrange = Color(0xFFFF6B00);
  static const Color greyBackground = Color(0xFFF8F8F8);
  static const Color darkText = Color(0xFF2C3E50);

  final TextEditingController _namaRumahController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _tipeRumahController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();

  List<String> _houseTypes = [];
  bool _loadingTypes = true;
  bool isEditMode = false;
  String? editingId;

  @override
  void initState() {
    super.initState();
    _initForm();
    _fetchPropertyTypes();
  }

  void _initForm() {
    final editing = context.read<PropertyCubit>().editingProperty;
    if (editing != null) {
      isEditMode = true;
      editingId = editing.propertyId;
      _namaRumahController.text = editing.namaRumah ?? '';
      _hargaController.text = (editing.harga ?? 0).toString();
      _tipeRumahController.text = editing.tipeRumah ?? '';
      _deskripsiController.text = editing.deskripsi ?? '';
      _lokasiController.text = editing.lokasi ?? '';
    }
  }

  Future<void> _fetchPropertyTypes() async {
    try {
      final cubit = context.read<PropertyCubit>();
      final types = await cubit.getPropertyTypes();
      setState(() {
        _houseTypes = types;
        _loadingTypes = false;
      });
    } catch (e) {
      setState(() => _loadingTypes = false);
      debugPrint('Failed to fetch types: $e');
    }
  }

  void _showHouseTypeBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Tipe Rumah',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: darkText),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 24.w, color: Colors.grey),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Divider(height: 1.h, thickness: 1.h, color: Colors.grey.shade200),
            if (_loadingTypes)
              Padding(
                padding: EdgeInsets.all(20.h),
                child: const CircularProgressIndicator(),
              )
            else
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _houseTypes.length,
                  itemBuilder: (_, index) {
                    final type = _houseTypes[index];
                    return ListTile(
                      title: Text(
                        type,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: _tipeRumahController.text == type ? primaryOrange : darkText,
                          fontWeight: _tipeRumahController.text == type ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      trailing: _tipeRumahController.text == type
                          ? Icon(Icons.check, color: primaryOrange, size: 20.w)
                          : null,
                      onTap: () {
                        setState(() {
                          _tipeRumahController.text = type;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 10.h),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final namaRumah = _namaRumahController.text.trim();
    final hargaText = _hargaController.text.trim();
    final tipeRumah = _tipeRumahController.text.trim();
    final deskripsi = _deskripsiController.text.trim();
    final lokasi = _lokasiController.text.trim();

    if (namaRumah.isEmpty ||
        hargaText.isEmpty ||
        tipeRumah.isEmpty ||
        deskripsi.isEmpty ||
        lokasi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua field harus diisi.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final harga = int.tryParse(hargaText);
    if (harga == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harga harus berupa angka yang valid.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final request = UpdatePropertyRequest(
      namaRumah: namaRumah,
      harga: harga,
      tipeRumah: tipeRumah,
      deskripsi: deskripsi,
      lokasi: lokasi,
    );

    final cubit = context.read<PropertyCubit>();

    if (isEditMode && editingId != null) {
      await cubit.update('penjual', editingId!, request);
      cubit.clearEditing();
    } else {
      final createRequest = CreatePropertyRequest(
        namaRumah: namaRumah,
        harga: harga,
        tipeRumah: tipeRumah,
        deskripsi: deskripsi,
        lokasi: lokasi,
      );
      await cubit.create('penjual', createRequest);
    }
  }

  void _resetForm() {
    _namaRumahController.clear();
    _hargaController.clear();
    _tipeRumahController.clear();
    _deskripsiController.clear();
    _lokasiController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PropertyCubit, PropertyState>(
      listener: (context, state) {
        state.whenOrNull(
          created: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Berhasil menambahkan properti.'), backgroundColor: primaryOrange),
            );
            _resetForm();
          },
          updated: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Berhasil mengubah properti.'), backgroundColor: primaryOrange),
            );
            Navigator.pop(context);
          },
          error: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gagal: $msg'), backgroundColor: Colors.red),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: greyBackground,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                isEditMode ? 'Edit Properti' : 'Buat Postingan Baru',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: darkText),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: darkText, size: 22.w),
                onPressed: () => Navigator.pop(context),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1.0.h),
                child: Container(color: Colors.grey.shade200, height: 1.0.h),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Properti',
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: darkText),
                    ),
                    SizedBox(height: 15.h),
                    CustomTextField(label: 'Nama Rumah', controller: _namaRumahController, hint: '',),
                    SizedBox(height: 20.h),
                    CustomTextField(label: 'Harga (Rp)', controller: _hargaController, keyboardType: TextInputType.number, hint: '',),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: 'Tipe Rumah',
                      controller: _tipeRumahController,
                      readOnly: true,
                      onTap: _showHouseTypeBottomSheet, hint: '',
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(label: 'Deskripsi', controller: _deskripsiController, maxLines: 5, hint: '',),
                    SizedBox(height: 20.h),
                    CustomTextField(label: 'Lokasi', controller: _lokasiController, hint: '',),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: FloatingActionButtonArea(onPressed: _submit),
      ),
    );
  }
}
