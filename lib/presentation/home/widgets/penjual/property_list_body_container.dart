import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/presentation/home/pages/seller/post.dart';
import 'package:propedia/presentation/home/widgets/penjual/property_list_item_card.dart';

class PropertyListBodyContainer extends StatefulWidget {
  const PropertyListBodyContainer({super.key});

  @override
  State<PropertyListBodyContainer> createState() =>
      _PropertyListBodyContainerState();
}

class _PropertyListBodyContainerState extends State<PropertyListBodyContainer> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<PropertyCubit>();
    cubit.fetchAllProperties('penjual');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.grey.shade300, width: 1.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: BlocBuilder<PropertyCubit, PropertyState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (properties) {
                  if (properties.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.h),
                        child: Text(
                          'Yahh, belum ada data 🥲',
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    separatorBuilder: (_, __) => Divider(height: 20.h),
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final p = properties[index];
                      return PropertyListItemCard(
                        property: p,
                        onEditTap: () {
                          final cubit = context.read<PropertyCubit>();
                          cubit.startEditing(p); // ⬅️ Simpan state editing
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PostPenjualanPage(),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                error: (msg) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Text(
                      msg ?? 'Gagal ambil data',
                      style: TextStyle(fontSize: 14.sp, color: Colors.red),
                    ),
                  ),
                ),
                detail: (_) => const SizedBox(),
                created: (_) => const SizedBox(),
                updated: () => const SizedBox(),
                deleted: () {
                  context.read<PropertyCubit>().fetchAllProperties('penjual');
                  return const SizedBox();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
