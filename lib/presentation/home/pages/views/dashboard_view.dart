import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/presentation/auth/pages/profiles/profile_page.dart';
import 'package:propedia/presentation/home/cubit/property_cubit.dart';
import 'package:propedia/presentation/home/cubit/property_state.dart';
import 'package:propedia/presentation/home/pages/chats/chat_pages.dart';
import 'package:propedia/presentation/home/pages/logic/dashboard_logic.dart';
import 'package:propedia/presentation/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:propedia/presentation/home/widgets/custom_search_bar.dart';
import 'package:propedia/presentation/home/widgets/house_card.dart';
import 'package:propedia/presentation/home/widgets/menu_section.dart';
import 'package:propedia/presentation/home/widgets/see_all.dart';
import 'package:propedia/presentation/home/widgets/utils/location_helper.dart';

class DashboardView extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userRole;
  final DashboardLogic dashboardLogic;

  const DashboardView({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userRole,
    required this.dashboardLogic,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  bool _isRefreshingData = false;

  @override
  void initState() {
    super.initState();
    context.read<PropertyCubit>().fetchAllProperties(widget.userRole);
  }

  Future<void> _handleRefresh() async {
    setState(() => _isRefreshingData = true);
    await context.read<PropertyCubit>().fetchAllProperties(widget.userRole);
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => _isRefreshingData = false);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePageContent(context),
      const Center(child: Text('Activity Page Content')),
      const Center(child: Text('Payment Page Content')),
      const ChatPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[widget.dashboardLogic.selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: widget.dashboardLogic.selectedIndex,
        onItemTapped: widget.dashboardLogic.onItemTapped,
      ),
    );
  }

  Widget _buildHomePageContent(BuildContext context) {
    const String defaultProfileImageUrl =
        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

    return SafeArea(
      child: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        color: const Color(0xFFFF6B00),
        backgroundColor: Colors.white,
        height: 100,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                  userName: widget.userName,
                                  userEmail: widget.userEmail,
                                  userRole: widget.userRole,
                                ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 25.w,
                            backgroundImage: NetworkImage(defaultProfileImageUrl),
                            onBackgroundImageError: (_, __) =>
                                debugPrint('Error loading profile image'),
                            child: defaultProfileImageUrl.isEmpty
                                ? Icon(Icons.person, size: 25.w, color: Colors.white)
                                : null,
                            backgroundColor: defaultProfileImageUrl.isEmpty
                                ? Colors.grey[300]
                                : null,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dashboardLogic.getGreeting(),
                              style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                            ),
                            Text(
                              widget.userName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none, size: 28.w, color: Colors.grey[700]),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    const Expanded(child: CustomSearchBar()),
                    SizedBox(width: 10.w),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade300, width: 1.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.menu_open, color: Colors.grey.shade600),
                        onPressed: widget.dashboardLogic.navigateToFilterPage,
                        iconSize: 24.w,
                        padding: EdgeInsets.all(12.w),
                        splashRadius: 24.w,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: MenuSection(
                  allMenuItems: widget.dashboardLogic.allMenuItems,
                  onItemTap: (index) {
                    widget.dashboardLogic.onMenuItemTapped(context, index);
                  },
                ),
              ),

              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Untuk Kamu',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final city = await LocationHelper.getCityFromLocation();
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SeeAllPropertiesPage(lokasiUser: city ?? ''),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFFFF6B00),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              BlocBuilder<PropertyCubit, PropertyState>(
                builder: (context, state) {
                  final properties = context.read<PropertyCubit>().userPostedProperties;

                  if (properties.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Belum ada properti yang kamu posting.',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                      ),
                    );
                  }

                  final limitedProps = properties.take(6).toList();

                  return SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: limitedProps.length,
                      itemBuilder: (context, index) {
                        final property = limitedProps[index];
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.w : 10.w,
                            right: 10.w,
                          ),
                          child: HouseCard(
                            title: property.namaRumah ?? 'Tanpa Judul',
                            price: property.harga?.toString() ?? 'Rp -',
                            location: property.lokasi ?? 'Lokasi tidak diketahui',
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
