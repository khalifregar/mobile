import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/presentation/home/widgets/penjual/property_list_app_bar.dart';
import 'package:propedia/presentation/home/widgets/penjual/property_list_body_container.dart';
import 'package:propedia/presentation/home/widgets/penjual/property_list_search_and_add_bar.dart';

class PropertyListPage extends StatelessWidget {
  const PropertyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PropertyListAppBar(),
      body: BlocBuilder<PropertyCubit, PropertyState>(
        builder: (context, state) {
          final properties = context.read<PropertyCubit>().userPostedProperties;

          return Column(
            children: [
              const PropertyListSearchAndAddBar(),
              const PropertyListBodyContainer(),
            ],
          );
        },
      ),
    );
  }
}
