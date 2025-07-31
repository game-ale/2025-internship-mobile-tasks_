import 'package:flutter/material.dart';
import 'package:task7/common/themes/app_colors.dart';
import 'package:task7/common/themes/text_styles.dart';
import '../common/widgets/input_inserted.dart';
import '../common/widgets/input_type_name.dart';

class AddUpdatePage extends StatefulWidget {
  const AddUpdatePage({super.key});

  @override
  State<AddUpdatePage> createState() => _AddUpdatePageState();
}

class _AddUpdatePageState extends State<AddUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Add Product",
                          style: AppTextStyles.addProductText,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.borderPrimary,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.image_outlined, size: 36),
                        Text('upload image', style: AppTextStyles.bodyText),
                      ],
                    ),
                  ),
                ),

                InputTypeName(name: "name"),
                InputInserted(),
                InputTypeName(name: "category"),
                InputInserted(),
                InputTypeName(name: 'price'),
                InputInserted(),
                InputTypeName(name: 'description'),
                InputInserted(height: 120),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("ADD", style: AppTextStyles.updateButton),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("DELETE", style: AppTextStyles.deleteButton),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
