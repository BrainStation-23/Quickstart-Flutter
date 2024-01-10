import 'package:flutter/material.dart';
import 'package:qs_flutter/core/base/widgets/app_multiselector.dart';
import 'package:qs_flutter/core/utils/utils.dart';

import '../../../../core/base/widgets/carousel_view.dart';
import '../../../../core/values/app_assets_path.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];
  List<String> selectedItems = [];
  List<CarouselData> listOfObjects = [
    CarouselData(
      AppAssets.appLogo,
      '1',
      'A',
      'X',
      10.0,
      '2023-01-01',
      '2023-01-15',
    ),
    CarouselData(
      AppAssets.appLogo,
      '2',
      'B',
      'Y',
      15.0,
      '2023-02-01',
      '2023-02-15',
    ),
    CarouselData(
      AppAssets.appLogo,
      '3',
      'C',
      'Z',
      20.0,
      '2023-03-01',
      '2023-03-15',
    ),
    CarouselData(
      AppAssets.appLogo,
      '4',
      'D',
      'W',
      25.0,
      '2023-04-01',
      '2023-04-15',
    ),
    CarouselData(
      AppAssets.appLogo,
      '5',
      'E',
      'V',
      30.0,
      '2023-05-01',
      '2023-05-15',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselView(onTap: (x){

              }, listOfCarouselData: listOfObjects),
              AppMultiSelector(
                items: items,
                selectedItems: selectedItems,
                onChanged: (items) {
                  selectedItems = items ?? [];
                },
              ),

              ElevatedButton(
                onPressed: () {
                  showConfirmationDialog(
                      title: "Confirmation",
                      content: const Text("This is String"),
                      context: context,
                      onCancel: () {},
                      onConfirm: () {});
                },
                child: const Text('Get Selected Items'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
