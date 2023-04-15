import 'package:flutter/material.dart';

class DetailProductSelector extends StatelessWidget {
  const DetailProductSelector({super.key});

  // final ProductDetail productDetail;

  @override
  Widget build(BuildContext context) {
    return Text("");
    // return Consumer<DetailPageViewModel>(
    //   builder: (context, viewModel, child) {
    //     return Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(top: 16),
    //           child: Text(
    //             productDetail.title,
    //             textAlign: TextAlign.start,
    //             style: bigTextStyle,
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 4),
    //           child: Text(
    //             productDetail.productId,
    //             textAlign: TextAlign.start,
    //             style: smallTextStyle,
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 32, bottom: 64),
    //           child: Text(
    //             "NT\$ ${productDetail.price}",
    //             textAlign: TextAlign.start,
    //             style: midTextStyle,
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 8.0),
    //           child: ProductSelector(
    //               title: "顏色",
    //               widget: ColorSelectorList(
    //                 colors: productDetail.colors,
    //                 selectedColorInt: viewModel.selectedColorInt,
    //                 selectedColorListener: viewModel.updateSelectColor,
    //               )),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 8.0),
    //           child: ProductSelector(
    //               title: "尺寸",
    //               widget: SizeSelectorList(
    //                 sizes: productDetail.sizes,
    //                 selectedSize: viewModel.selectSize,
    //                 selectedSizeListener: viewModel.updateSelectSize,
    //               )),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 8.0),
    //           child: ProductSelector(
    //               title: "數量",
    //               widget: StockSelector(
    //                 qty: viewModel.selectedQty,
    //                 addQtyListener: viewModel.addQty,
    //                 minusQtyListener: viewModel.minusQty,
    //               )),
    //         ),
    //         Padding(
    //             padding: const EdgeInsets.only(top: 8.0),
    //             child: SizedBox(
    //               height: 50,
    //               width: 150,
    //               child: Card(
    //                 shape: RoundedRectangleBorder(
    //                   side: const BorderSide(
    //                     color: Colors.black,
    //                     width: 1,
    //                   ),
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: const Center(child: Text('加入購物車')),
    //               ),
    //             )),
    //       ],
    //     );
    //   },
    // );
  }
}
