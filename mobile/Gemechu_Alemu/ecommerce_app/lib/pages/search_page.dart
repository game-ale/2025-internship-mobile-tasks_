import 'package:flutter/material.dart';
import 'package:task6/components/product_category.dart';
import '../common/themes/app_colors.dart';
import '../common/themes/text_styles.dart';
import 'package:task6/product_models/product_manager.dart';
//import 'package:task6/product_models/sample_products.dart';
import '../common/widgets/input_inserted.dart';
import '../common/widgets/input_type_name.dart';
import '../components/product_card.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ProductCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.secondary,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Search Product",
                        style: AppTextStyles.addProductText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: InputInserted(height: 48)),
                  SizedBox(width: 10),
                  Container(
                    width: 48,
                    height: 48,
                    child: Icon(
                      Icons.filter_list,
                      color: AppColors.background,
                      size: 30,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                  itemCount: ProductManager().howManyProducts(),
                  itemBuilder: (context, index) {
                    final product = ProductManager().products[index];
                    return ProductCard(product: product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: SizedBox(
          height: 290,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputTypeName(name: "Category"),
              CategoryDropdown(
                selectedCategory: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              InputTypeName(name: "Price"),
              PriceRangeSlider(
                min: 0,
                max: 1000,
                initialRange: RangeValues(100, 600),
                onChanged: (range) {},
              ),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 25,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("APPLY", style: AppTextStyles.updateButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryDropdown extends StatelessWidget {
  final ProductCategory? selectedCategory;
  final void Function(ProductCategory?) onChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white, // or AppColors.borderPrimary if you want
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade400,
        ), // input field-like border
      ),
      child: DropdownButtonHideUnderline(
        // removes the default underline
        child: DropdownButton<ProductCategory>(
          value: selectedCategory,
          onChanged: onChanged,
          isExpanded: true, // makes it fill the width

          items: ProductCategory.values.map((ProductCategory category) {
            return DropdownMenuItem<ProductCategory>(
              value: category,
              child: Text(category.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class PriceRangeSlider extends StatefulWidget {
  final double min;
  final double max;
  final RangeValues initialRange;
  final ValueChanged<RangeValues> onChanged;

  const PriceRangeSlider({
    super.key,
    required this.min,
    required this.max,
    required this.initialRange,
    required this.onChanged,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  late RangeValues _currentRange;

  @override
  void initState() {
    super.initState();
    _currentRange = widget.initialRange;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: const Color(0xFF3F51F3), // Blue track
        inactiveTrackColor: Colors.grey.shade300, // Grey background
        thumbColor: Colors.white, // White thumbs
        overlayColor: const Color(
          0x333F51F3,
        ), // Slightly transparent when pressed
        trackHeight: 10,

        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 2),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
        rangeThumbShape: const RoundRangeSliderThumbShape(
          enabledThumbRadius: 6,
        ),
      ),
      child: RangeSlider(
        values: _currentRange,
        min: widget.min,
        max: widget.max,
        divisions: ((widget.max - widget.min) / 10).round(),

        onChanged: (values) {
          setState(() {
            _currentRange = values;
          });
          widget.onChanged(values);
        },
      ),
    );
  }
}
