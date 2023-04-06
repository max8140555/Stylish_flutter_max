import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_max/screens/detail/detail_page_view_model.dart';
import 'package:stylish_max/screens/detail/model/calculate_qty_strategy.dart';

class DetailProductSelector extends StatelessWidget {
  const DetailProductSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailPageViewModel>(
      builder: (context, viewModel, child) {
        return Expanded(
          child: LayoutBuilder(builder: (context, container) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(viewModel.productDetail.title, textAlign: TextAlign.start),
                Text(viewModel.productDetail.productId,
                    textAlign: TextAlign.start),
                Text("NT\$ ${viewModel.productDetail.price}",
                    textAlign: TextAlign.start),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ProductSelector(
                      title: "顏色",
                      widget: ColorSelectorList(
                        colors: viewModel.productDetail.colors,
                        selectedColorInt: viewModel.selectColorInt,
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
                  padding: EdgeInsets.only(top: 8.0),
                  child: ProductSelector(
                      title: "數量",
                      widget: StockSelector(
                          qty: viewModel.selectQty,
                          qtyListener: viewModel.updateSelectQty)),
                )
              ],
            );
          }),
        );
      },
    );
  }
}

class ProductSelector extends StatelessWidget {
  const ProductSelector({
    super.key,
    required this.widget,
    required this.title,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Expanded(
        child: Row(
          children: [
            Text(title),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child:
                  VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
            ),
            widget
          ],
        ),
      ),
    );
  }
}

class ColorSelectorList extends StatelessWidget {
  const ColorSelectorList({
    super.key,
    required this.colors,
    required this.selectedColorListener,
    required this.selectedColorInt,
  });

  final List<int> colors;
  final int? selectedColorInt;
  final void Function(int) selectedColorListener;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: colors
                .map((colorInt) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: GestureDetector(
                          onTap: () {
                            selectedColorListener.call(colorInt);
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Color(colorInt),
                              border: Border.all(
                                color: selectedColorInt == colorInt
                                    ? Colors.red
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          )),
                    ))
                .toList(),
          );
        },
        itemCount: 1,
      ),
    );
  }
}

class SizeSelectorList extends StatelessWidget {
  const SizeSelectorList({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.selectedSizeListener,
  });

  final List<String> sizes;
  final String selectedSize;
  final void Function(String) selectedSizeListener;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: sizes
                .map((size) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: GestureDetector(
                        onTap: () {
                          selectedSizeListener.call(size);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedSize == size
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ),
                            Text(size),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          );
        },
        itemCount: 1,
      ),
    );
  }
}

class StockSelector extends StatelessWidget {
  const StockSelector(
      {super.key, required this.qty, required this.qtyListener});

  final int qty;
  final void Function(CalculateQtyStrategy) qtyListener;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: GestureDetector(
            onTap: () {
              qtyListener.call(CalculateQtyStrategy.minus());
            },
            child: const SizedBox(
                height: 20,
                width: 30,
                child: Text("-", textAlign: TextAlign.center)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: SizedBox(child: Text("$qty", textAlign: TextAlign.center)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: GestureDetector(
            onTap: () {
              qtyListener.call(CalculateQtyStrategy.plus());
            },
            child: const SizedBox(
                height: 20,
                width: 30,
                child: Text("+", textAlign: TextAlign.center)),
          ),
        ),
      ],
    );
  }
}
