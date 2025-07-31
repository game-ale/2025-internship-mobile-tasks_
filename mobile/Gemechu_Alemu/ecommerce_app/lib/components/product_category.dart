enum ProductCategory {
  male_shoes,
  female_shoes,
  male_jacket,
  female_jacket,
  trossers,
  t_shirt,
  home,
  beauty,
}

extension ProductCategoryExtension on ProductCategory {
  String get displayName {
    switch (this) {
      case ProductCategory.male_shoes:
        return "Men's Shoes";
      case ProductCategory.female_shoes:
        return "Female's Shoes";
      case ProductCategory.male_jacket:
        return 'Men\'s Jacket';
      case ProductCategory.female_jacket:
        return 'female\'s Jacket';
      case ProductCategory.beauty:
        return 'Beauty & Personal Care';
      case ProductCategory.home:
        return 'Home & Living';
      case ProductCategory.trossers:
        return 'Trousers & Jeans';
      case ProductCategory.t_shirt:
        return 'T-Shirts & Polos';
    }
  }
}
