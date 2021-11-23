import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/data/models/tag.dart';
import 'package:shopping_store/app/data/models/variant.dart';
import 'package:shopping_store/app/modules/details/controllers/details_controller.dart';
import 'package:shopping_store/app/shared/back_icon.dart';
import 'package:shopping_store/app/shared/bounce_point.dart';
import 'package:shopping_store/app/shared/header_button.dart';
import 'package:shopping_store/app/shared/image_network.dart';
import 'package:shopping_store/app/shared/response_error.dart';

class DetailsView extends StatefulWidget {
  final Product? product;
  const DetailsView({Key? key, this.product}) : super(key: key);
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final DetailsController controller = Get.put(DetailsController());
  late PageController pageController = PageController();
  late AppResponse appResponse = AppResponse();
  late int pageIndex;

  get getAppResponse async {
    Future.delayed(Duration.zero, () async {
      appResponse = await controller.loadProduct("${widget.product!.id}");
    });
  }

  @override
  void initState() {
    getAppResponse;
    super.initState();
    pageIndex = 0;
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryBackColor,
        leading: BackIcon(onPressed: () => Get.back()),
        title: Text("${widget.product!.name}"),
        actions: [
          HeaderButton(icon: CupertinoIcons.heart_fill, onPressed: () {}),
          HeaderButton(icon: CupertinoIcons.cart_fill, onPressed: () {}),
        ],
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          if (appResponse.success) {
            final Product product = appResponse.response;
            final List<Variant> variants = product.variants ?? [];
            final List<Tag> tags = product.tags ?? [];
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  onPageChanged: (index) {
                    setState(() => {pageIndex = index});
                  },
                  controller: pageController,
                  itemCount: variants.length,
                  itemBuilder: (context, i) {
                    //final Variant variant = variants[i];
                    //final Picture picture = variant.picture!;
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundImageColor,
                      ),
                      child: ImageNetwork(
                        image: "${AppMessage.placeHolder}",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100,
                      child: PageView.builder(
                        controller: PageController(
                          viewportFraction: .25,
                          initialPage: pageIndex,
                        ),
                        physics: BouncingScrollPhysics(),
                        padEnds: false,
                        pageSnapping: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: product.variants!.length,
                        itemBuilder: (context, i) {
                          final Variant variant = variants[i];
                          //final Picture picture = variant.picture!;
                          final bool state = pageIndex == i;
                          return GestureDetector(
                            onTap: () {
                              pageIndex = i;
                              pageController.animateToPage(
                                pageIndex,
                                duration: AppConstant.durationAnimation,
                                curve: AppConstant.curve,
                              );
                            },
                            child: Opacity(
                              opacity: state ? 1 : .32,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppTheme.backgroundImageColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1.5,
                                    color:
                                        state ? Color(variant.getColor) : AppTheme.transparentColor,
                                  ),
                                ),
                                child: ImageNetwork(
                                  image: "${AppMessage.placeHolder}",
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (tags.isNotEmpty)
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(5),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: product.tags!.length,
                          itemBuilder: (context, i) {
                            final Tag tag = tags[i];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Chip(
                                backgroundColor: AppTheme.mainColor,
                                label: Text("${tag.name}"),
                                labelStyle: TextStyle(
                                  color: AppTheme.secondaryTextColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                )
              ],
            );
          } else {
            return ResponseError(response: appResponse);
          }
        } else {
          return BouncePoint();
        }
      }),
    );
  }
}
