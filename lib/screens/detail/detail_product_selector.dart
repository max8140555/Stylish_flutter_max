import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_max/screens/detail/component/color_selector_list.dart';
import 'package:stylish_max/screens/detail/component/product_selector.dart';
import 'package:stylish_max/screens/detail/component/size_selector_list.dart';
import 'package:stylish_max/screens/detail/component/stock_selector_list.dart';
import 'package:stylish_max/screens/detail/detail_page_view_model.dart';
import 'package:stylish_max/values/text_styles.dart';

class DetailProductSelector extends StatelessWidget {
  const DetailProductSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailPageViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                viewModel.productDetail.title,
                textAlign: TextAlign.start,
                style: bigTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                viewModel.productDetail.productId,
                textAlign: TextAlign.start,
                style: smallTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 64),
              child: Text(
                "NT\$ ${viewModel.productDetail.price}",
                textAlign: TextAlign.start,
                style: midTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ProductSelector(
                  title: "顏色",
                  widget: ColorSelectorList(
                    colors: viewModel.productDetail.colors,
                    selectedColorInt: viewModel.selectedColorInt,
                    selectedColorListener: viewModel.updateSelectColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ProductSelector(
                  title: "尺寸",
                  widget: SizeSelectorList(
                    sizes: viewModel.productDetail.sizes,
                    selectedSize: viewModel.selectSize,
                    selectedSizeListener: viewModel.updateSelectSize,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ProductSelector(
                  title: "數量",
                  widget: StockSelector(
                    qty: viewModel.selectedQty,
                    addQtyListener: viewModel.addQty,
                    minusQtyListener: viewModel.minusQty,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text('加入購物車')),
                  ),
                )),
          ],
        );
      },
    );
  }
}
