import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:propedia/presentation/home/pages/seller/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';

class PropertyListItemCard extends StatefulWidget {
  final PropertyDto property;
  final VoidCallback? onEditTap;

  const PropertyListItemCard({
    super.key,
    required this.property,
    this.onEditTap,
  });

  @override
  State<PropertyListItemCard> createState() => _PropertyListItemCardState();
}

class _PropertyListItemCardState extends State<PropertyListItemCard> {
  String? transactionNumber;

  @override
  void initState() {
    super.initState();
    _loadTransactionNumber();
  }

  void _loadTransactionNumber() async {
    final prefs = await SharedPreferences.getInstance();
    final fallbackKey =
        '${widget.property.namaRumah}-${widget.property.lokasi}-${widget.property.harga}'.toLowerCase();
    final id = (widget.property.propertyId?.isNotEmpty == true)
        ? widget.property.propertyId!
        : fallbackKey;

    final saved = prefs.getString('transaction_$id');
    if (saved != null) {
      setState(() => transactionNumber = saved);
      return;
    }

    final random = Random();
    final gen = 'B-${random.nextInt(99) + 1}-RK${_randStr(6)}-${_randStr(2)}';

    await prefs.setString('transaction_$id', gen);
    setState(() => transactionNumber = gen);
  }

  String _randStr(int len) {
    final random = Random();
    return List.generate(len, (_) => String.fromCharCode(random.nextInt(26) + 65)).join();
  }

  @override
  Widget build(BuildContext context) {
    if (transactionNumber == null) return const SizedBox();

    return GestureDetector(
      onTap: () => _showBottomSheet(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nomor Transaksi: $transactionNumber',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
              SizedBox(height: 10.h),
              _buildRow('Nama', widget.property.namaRumah ?? '-'),
              Divider(height: 16.h, thickness: 0.5, color: Colors.grey.shade200),
              _buildRow('Tipe Rumah', widget.property.tipeRumah ?? '-'),
              Divider(height: 16.h, thickness: 0.5, color: Colors.grey.shade200),
              _buildRow('Lokasi', widget.property.lokasi ?? '-'),
              Divider(height: 16.h, thickness: 0.5, color: Colors.grey.shade200),
              _buildRow(
                'Harga',
                'Rp${NumberFormat.decimalPattern('id').format(widget.property.harga ?? 0)}',
                valueColor: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {Color? valueColor}) {
    return Row(
      children: [
        SizedBox(width: 110.w, child: Text(label, style: TextStyle(fontSize: 12.sp))),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 12.sp, color: valueColor ?? Colors.black),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Detail Properti', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.h),
              Text('Nomor Transaksi: $transactionNumber',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
              SizedBox(height: 10.h),
              _buildRow('Nama :', widget.property.namaRumah ?? '-'),
              SizedBox(height: 10.h),
              _buildRow('Lokasi :', widget.property.lokasi ?? '-'),
              SizedBox(height: 10.h),
              _buildRow(
                'Harga :',
                'Rp${NumberFormat.decimalPattern('id').format(widget.property.harga ?? 0)}',
                valueColor: Colors.orange,
              ),
              SizedBox(height: 10.h),
              _buildRow('Tipe Rumah :', widget.property.tipeRumah ?? '-'),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onPressed: () {
                        Navigator.pop(ctx);
                        final cubit = context.read<PropertyCubit>();
                        cubit.startEditing(widget.property);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PostPenjualanPage()),
                        );
                      },
                      child: const Text('Ubah'),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onPressed: () async {
                        Navigator.pop(ctx);

                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (c) => AlertDialog(
                            title: const Text('Konfirmasi Hapus'),
                            content: const Text('Yakin ingin menghapus properti ini?'),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Batal')),
                              TextButton(
                                onPressed: () => Navigator.pop(c, true),
                                child: const Text('Hapus', style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );

                        if (confirm != true) return;

                        try {
                          final cubit = context.read<PropertyCubit>();
                          final prefs = await SharedPreferences.getInstance();
                          final token = prefs.getString('access_token');
                          final role = prefs.getString('role');

                          if (role == null || token == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Token atau role tidak tersedia')),
                            );
                            return;
                          }

                          await cubit.delete(role, widget.property.propertyId!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Properti berhasil dihapus')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Gagal menghapus: $e')),
                          );
                        }
                      },
                      child: const Text('Hapus'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
