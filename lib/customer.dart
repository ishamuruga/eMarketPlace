import 'package:flutter/material.dart';

import 'services/cloudfirestore_methods.dart';
import 'services/firebase.dart';
import 'utils/constants.dart';
import 'widgets/ad_banner_widget.dart';
import 'widgets/categories_horizontal_list_view_bar.dart';
import 'widgets/loading_widget.dart';
import 'widgets/products_showcase_list_view.dart';

class customerDashboard extends StatefulWidget {
  const customerDashboard({super.key});

  @override
  State<customerDashboard> createState() => _customerDashboardState();
}

class _customerDashboardState extends State<customerDashboard> {
  String nam="loading";

  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  Future logout()async {
  await AuthService().googleSignOut();
}

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void getData() async {
    List<Widget> temp70 =
        await CloudFirestoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 =
        await CloudFirestoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 =
        await CloudFirestoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFirestoreClass().getProductsFromDiscount(0);
    print("everything is done");
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Customer Dashboard"),
          actions: [IconButton(onPressed: (){logout();}, icon: Icon(Icons.logout))],
        ),
      body: discount70 != null &&
              discount60 != null &&
              discount50 != null &&
              discount0 != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      SizedBox(
                        height: kAppBarHeight / 2,
                      ),
                       CategoriesHorizontalListViewBar(),
                       AdBannerWidget(),
                      ProductsShowcaseListView(
                          title: "Upto 70% Off", children: discount70!),
                      ProductsShowcaseListView(
                          title: "Upto 60% Off", children: discount60!),
                      ProductsShowcaseListView(
                          title: "Upto 50% Off", children: discount50!),
                      ProductsShowcaseListView(
                          title: "Explore", children: discount0!),
                    ],
                  ),
                ),
                // UserDetailsBar(
                //   offset: offset,
                // ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
