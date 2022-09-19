import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeta_box_test_app/constant/color_palette.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';
import 'package:zeta_box_test_app/constant/urls_images.dart';
import 'package:zeta_box_test_app/view/home/home_controller.dart';
import 'package:zeta_box_test_app/view/widgets/app_buttons.dart';
import 'package:zeta_box_test_app/view/widgets/product_card.dart';
import 'package:zeta_box_test_app/view/widgets/profile_picture.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const _BuildAppBar(),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          parfumePubUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 30,
                      child: AppButtons.elevatePrimary(
                        onPressed: () {},
                        buttonColor: secondaryColor,
                        width: 50,
                        title: 'SHOP NOW',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: homeController.categoryList.length,
                      itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: neutralColor, width: 1),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: homeController.categorySelected == index
                              ? AppButtons.elevatePrimary(
                                  onPressed: () => homeController.selectCategory(index),
                                  title: homeController.categoryList[index],
                                )
                              : AppButtons.elevateSecondary(
                                  onPressed: () => homeController.selectCategory(index),
                                  title: homeController.categoryList[index],
                                )),
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: ((Get.width - 80) / 2 / 250),
                  children: homeController.filteredProductList.isNotEmpty
                      ? List.generate(
                          homeController.filteredProductList.length,
                          (index) =>
                              ProductCard(product: homeController.filteredProductList[index]),
                        )
                      : List.generate(
                          homeController.productList.length,
                          (index) => ProductCard(product: homeController.productList[index]),
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: homeController.currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: neutralColor,
          onTap: homeController.selectTab,
          items: [
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home, size: 36),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.email, size: 36),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.card_giftcard, size: 36),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: ProfilePicture(
                avatarUrl: navigationAvatarUrl,
                borderColor: homeController.currentIndex == 3 ? Colors.black : null,
                borderThikness: 2,
                diameter: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildAppBar extends StatelessWidget {
  const _BuildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Padding(
        padding: const EdgeInsets.only(bottom: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButtons.icon(
              withBorder: true,
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code,
              ),
            ),
            Row(
              children: [
                if (homeController.genderSelected == 0) ...[
                  AppButtons.elevatePrimary(
                    onPressed: () => homeController.selectGender(0),
                    title: 'Man',
                    width: 100,
                  ),
                  const SizedBox(width: 10),
                  AppButtons.text(
                    onPressed: () => homeController.selectGender(1),
                    titleStyle: normalNeutralLabel,
                    title: 'Woman',
                  ),
                ] else ...[
                  AppButtons.text(
                    onPressed: () => homeController.selectGender(0),
                    titleStyle: normalNeutralLabel,
                    title: 'Man',
                  ),
                  const SizedBox(width: 10),
                  AppButtons.elevatePrimary(
                    onPressed: () => homeController.selectGender(1),
                    title: 'Woman',
                    width: 100,
                  ),
                ]
              ],
            ),
            AppButtons.icon(
              withBorder: true,
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
